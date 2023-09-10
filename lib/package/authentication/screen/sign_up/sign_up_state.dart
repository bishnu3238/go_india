import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../package/package.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.phoneNumber = const MobileNumber.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  @override
  String toString() {
    return 'SignUpState{phoneNumber: $phoneNumber, status: $status, errorMessage: $errorMessage, isValid: $isValid}';
  }

  final MobileNumber phoneNumber;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final bool isValid;

  SignUpState copyWith({
    MobileNumber? phoneNumber,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return SignUpState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        phoneNumber,
        status,
      ];
}
