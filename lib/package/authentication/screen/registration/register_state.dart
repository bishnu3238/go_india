 import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../package/package.dart';

final class RegisterState extends Equatable {
  final Username username;
  final MobileNumber phoneNumber;
  final Email email;
  final ReferralCode referralCode;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  const RegisterState(
      {this.username = const Username.pure(),
      this.phoneNumber = const MobileNumber.pure(),
      this.email = const Email.pure(),
      this.referralCode = const ReferralCode.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage});

  RegisterState copyWith({
    Username? username,
    MobileNumber? phoneNumber,
    Email? email,
    ReferralCode? referralCode,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      RegisterState(
        username: username ?? this.username,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        referralCode: referralCode ?? this.referralCode,
        status:
            status ?? this.status,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        username,
        phoneNumber,
        email,
        referralCode,
        status,
        isValid,
        errorMessage
      ];
}
