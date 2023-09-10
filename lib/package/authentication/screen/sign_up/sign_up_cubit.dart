import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import 'sign_up_state.dart';
import '../../../package/package.dart';
import '../otp/export.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authRepository, this.notifier) : super(const SignUpState());

  final AuthRepository _authRepository;
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

  static void listener(BuildContext context, SignUpState state) {
    if (state.status.isFailure) {
      context.read<SignUpCubit>().notifier.errorMessage(
            context: context,
            message: state.errorMessage ?? "Authentication Failure",
          );
    }
  }
}
