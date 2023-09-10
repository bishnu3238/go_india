import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
 import 'package:go_india/routes/route_path.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/store/store.dart';
import '../../../package/package.dart';
import 'export.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this._authRepository,   this.driverStore,
      this.notifier, this.params)
      : super(OtpState(params));

  final AuthRepository _authRepository;
   final OtpPageInitialParams params;
  final Notifier notifier;
  final DriverStore driverStore;

  void inputOtp(String value) {
    final otp = Otp.dirty(value);
    emit(
      state.copyWith(
        otp: otp,
        isValid: Formz.validate([otp]),
      ),
    );
  }

  Future<void> verify(BuildContext context) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    await _authRepository.verifyOtp(state.params.vID, state.otp.value).then(
          (value) => value.fold(
            (l) {
              l.log();
              emit(state.copyWith(status: FormzSubmissionStatus.failure));
              emit(state.copyWith(errorMessage: l.message));
            },
            (driver) {


              '''hello $driver'''.log();
              driverStore.setDriver(driver);

              emit(state.copyWith(status: FormzSubmissionStatus.success));
            },
          ),
        );
  }

  void autoFillOTP() async {}

  static void listener(BuildContext context, OtpState state) {
    if (state.status.isFailure) {
      context.read<OtpCubit>().notifier.errorMessage(
            context: context,
            message: state.errorMessage ?? "Authentication Failure",
          );
    } else if (state.errorMessage != null) {
      context.read<OtpCubit>().notifier.errorMessage(
            context: context,
            message: state.errorMessage ?? "Authentication Failure",
          );
    } else if (state.status.isSuccess) {
      context.go(Screen.welcomeDriverDetails.path);
    }
  }

  Future<void> resendOTP(BuildContext context) async {
    await _authRepository.sendOtp(
        phoneNumber: params.phoneNO.phoneNoWithCountryCode,
        codeSend: (String vid, int? token) {
          notifier.successMessage(
              context: context, message: 'message send successful');
          emit(state.copyWith(
              params: OtpPageInitialParams(
                  vID: vid, phoneNO: params.phoneNO, token: token)));
        },     pvFailed: (FirebaseAuthException e) {
      var left = FirebaseSendOtpFailure.fromCode(e.code);
      emit(state.copyWith(
          errorMessage: left.message, status: FormzSubmissionStatus.failure));
    },);
  }
}
