import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repository/repository.dart';
import '../../../../domain/store/store.dart';
import '../../../../utility/utility/utility.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import '../../../package/package.dart';
import 'log_in_state.dart';
import '../otp/export.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository, this._driverRepository,
      this._detailsRepository, this.notifier)
      : super(const LoginState());

  final AuthRepository _authRepository;
  final DriverRepository _driverRepository;
  final DriverDetailsRepository _detailsRepository;
  final Notifier notifier;
  late BuildContext context;

  void numberChanged(String value) {
    final phone = MobileNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phone,
        isValid: Formz.validate([phone]),
      ),
    );
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> checkPhoneNo() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    await _driverRepository.checkPhoneNo({
      "mobile": state.phoneNumber.value
    }).then((value) => value.fold(
          (l) {
            emit(state.copyWith(status: FormzSubmissionStatus.failure));

            emit(state.copyWith(
                errorMessage: l.message,
                status: FormzSubmissionStatus.failure));
          },
          (r) {
            r.log();

            if (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              _detailsRepository.getVehicleDetails(
                  {'driver_id': getIt<DriverStore>().state.id});
            } else {
              sendOpt();
            }
          },
        ));
  }

  // keytool -list -v -alias androiddebugkey -keystore C:\Users\deepb\.android\debug.keystore

  Future<void> sendOpt() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await _authRepository.sendOtp(
      phoneNumber: state.phoneNumber.phoneNoWithCountryCode,
      codeSend: (String vid, int? token) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));

        context.go(Screen.otp.path,
            extra: OtpPageInitialParams(
              vID: vid,
              token: token,
              phoneNO: state.phoneNumber,
            ));
      },
      pvFailed: (FirebaseAuthException e) {
        var left = FirebaseSendOtpFailure.fromCode(e.code);
        emit(state.copyWith(
            errorMessage: left.message, status: FormzSubmissionStatus.failure));
      },
    );
  }

  static void listener(BuildContext context, LoginState state) {
    if (state.status.isFailure) {
      context.read<LoginCubit>().notifier.errorMessage(
            context: context,
            message: state.errorMessage ?? "Authentication Failure",
          );
    }
  }
}
