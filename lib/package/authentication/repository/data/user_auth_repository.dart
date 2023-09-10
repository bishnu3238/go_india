import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../../domain/entity/entity.dart';
import '../../../../domain/store/store.dart';
import '../../../../utility/utility/utility.dart';
import '../../../package/package.dart';

typedef CodeSend = void Function(String, int?);
typedef PVFailed = void Function(auth.FirebaseAuthException e);

class UserAuthRepository implements AuthRepository {
  // final UserStore userStore;
  final DriverStore driverStore;

  final NetworkService networkService;
  final auth.FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  final controller = StreamController<AuthStatus>();

  UserAuthRepository({
    // required this.userStore,
    required this.driverStore,
    required this.networkService,
    CacheClient? cache,
    auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSingIn,
  })  : _auth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _googleSignIn = googleSingIn ?? GoogleSignIn(); //.standard();

  @override
  // User get currentUser => userStore.state;
  Driver get currentDriver => driverStore.state;

  @override
  Future<void> logInWithDB({
    required String userName,
    required String password,
    required String url,
  }) async {
    try {
      await networkService.post(
        url,
        {'mobile': userName, 'password': password},
      );
    } catch (e) {
      throw LogInWithServerFailure(e.toString());
    }
  }

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } on auth.FirebaseAuthException catch (e) {
      throw FirebaseLogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const FirebaseLogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<auth.UserCredential> logInWithGoogle() async {
    try {
      late final auth.AuthCredential credential;
      if (kIsWeb) {
        auth.GoogleAuthProvider googleProvider = auth.GoogleAuthProvider();
        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

        return await _auth.signInWithPopup(googleProvider);
      } else {
        final googleUser = await _googleSignIn.signIn();

        final googleAuth = await googleUser?.authentication;

        credential = auth.GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        return await _auth.signInWithCredential(credential);
      }
    } on auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  @override
  void logOut() async {
    try {
      await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
      var driver =
          driverStore.state.copyWith(authStatus: AuthStatus.unauthenticated);
      driverStore.setDriver(driver);
      HydratedBloc.storage.clear();

      'User logOut'.log();
    } catch (e) {
      throw const LogOutFailure();
    }
  }

  @override
  Future<Either<FirebaseSendOtpFailure, bool>> sendOtp({
    required String phoneNumber,
    required CodeSend codeSend,    required PVFailed pvFailed,

  }) async {
    try {
      if (kIsWeb) {
        var confirmResult = await _auth.signInWithPhoneNumber(phoneNumber);
        var userCredential = await confirmResult.confirm('123456');
        if (userCredential.user != null) return right(true);
        return left(
          const FirebaseSendOtpFailure('Firebase phone auth failure'),
        );
      } else {
        phoneNumber.log;
        _auth.setSettings(forceRecaptchaFlow: false);
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: _verificationCompleted,
          verificationFailed: pvFailed,
          codeSent: codeSend,
          timeout: oneMinute,
          codeAutoRetrievalTimeout: _timeOut,
        );
        return right(true);
      }
    } catch (e) {
      e.log;
      return left(FirebaseSendOtpFailure(e.toString()));
    }
  }

  void _timeOut(String verificationId) {}

  void _verificationCompleted(auth.PhoneAuthCredential credential) {
    '${credential.smsCode} ${credential.signInMethod} ${credential.providerId}'
        .log();
  }



  @override
  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      throw FirebaseSignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const FirebaseSignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(oneSecond);
    yield AuthStatus.unauthenticated;
    yield* controller.stream;
  }

  @override
  // TODO: here have some complications , because user getting from local or firebase local;
  // Stream<User> get user {
  //   return _auth.authStateChanges().map((firebaseUser) {
  //     User user = firebaseUser == null ? userStore.state : firebaseUser.toUser;
  //     userStore.setUser(user);
  //     return user;
  //   });
  // }

  Stream<Driver> get driver {
    return _auth.authStateChanges().map((firebaseUser) {
      Driver driver = firebaseUser == null
          ? driverStore.state
          : driverStore.state.isNotEmpty
              ? driverStore.state.copyWith(
                  uid: firebaseUser.uid, authStatus: AuthStatus.authenticated)
              : driverStore.state;
      driverStore.setDriver(driver);
      return driver;
    });
  }

  @override
  void dispose() => controller.close();

  @override
  Future<void> checkPhNoExistsOrNot(
      {required String ph, required String url}) async {
    await networkService.post(
      url,
      {'mobile': ph},
    );
  }

  @override
  Future<Either<FirebaseOtpVerificationFailure, Driver>> verifyOtp(
    String verifyId,
    String smsCode,
  ) async {
    final credential = auth.PhoneAuthProvider.credential(
      verificationId: verifyId,
      smsCode: smsCode,
    );

    try {
      auth.UserCredential user = await _auth.signInWithCredential(credential);
      if (user.user != null) {
        return right(user.user!.toDriver);
      }
      return left(const FirebaseOtpVerificationFailure());
    } on FirebaseException catch (e) {
      return left(FirebaseOtpVerificationFailure.fromCode(e.code));
    }
  }
}

extension on auth.User {
  // User get toUser => User.empty.copyWith(
  //       uid: uid,
  //       name: displayName ?? '',
  //       email: email ?? '',
  //       phone: phoneNumber ?? '',
  //       image: photoURL ?? '',
  //       gender: Gender.unknown,
  //       date: metadata.creationTime,
  //       status: AuthStatus.authenticated,
  //     );

  Driver get toDriver => Driver.empty.copyWith(
        uid: uid,
        name: displayName ?? '',
        mobile: phoneNumber ?? '',
        image: photoURL ?? '',
        gender: Gender.unknown,
        authStatus: AuthStatus.authenticated,
        status: 1,
        date: metadata.creationTime,
      );
}
