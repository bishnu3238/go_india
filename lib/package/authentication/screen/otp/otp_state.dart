import 'package:formz/formz.dart';
import 'package:go_india/package/package/package.dart';
import 'export.dart';

class OtpState {
  final OtpPageInitialParams _params;
  OtpState(OtpPageInitialParams params,
      {this.otp = const Otp.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.errorMessage,
      this.isValid = false})
      : _params = params;

  final Otp otp;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final bool isValid;

  OtpState copyWith({
    OtpPageInitialParams ?params,
    Otp? otp,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return OtpState(
      params ?? _params,
      otp: otp ?? this.otp,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() {
    return 'OtpState{_params: $_params, otp: $otp, status: $status, errorMessage: $errorMessage, isValid: $isValid}';
  }

  OtpPageInitialParams get params => _params;
}
