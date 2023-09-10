import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../../domain/entity/entity.dart';
import '../../../../utility/utility/utility.dart';
import '../../authentication.dart';

abstract class AuthRepository {
  // User get currentUser;
  Driver get currentDriver;
  // Stream<User> get user;
  Stream<Driver> get driver;

  Stream<AuthStatus> get status;

  ///
  ///
  Future<auth.UserCredential> logInWithGoogle();

  ///
  ///
  Future<void> logInWithEmailAndPassword(
    String email,
    String password,
  );

  ///
  ///
  Future<void> checkPhNoExistsOrNot({
    required String ph,
    required String url,
  });

  ///
  ///
  Future<Either<FirebaseSendOtpFailure, bool>> sendOtp({
    required String phoneNumber,
    required CodeSend codeSend,
    required PVFailed pvFailed,
  });

  ///
  ///
  Future<Either<FirebaseOtpVerificationFailure, Driver>> verifyOtp(
    String verifyId,
    String smsCode,
  );

  ///
  ///
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  });

  ///
  ///
  Future<void> logInWithDB({
    required String userName,
    required String password,
    required String url,
  });

  ///
  ///
  void logOut();

  ///
  ///
  void dispose();
}
