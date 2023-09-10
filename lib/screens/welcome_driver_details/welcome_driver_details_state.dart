import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../package/package/package.dart';

class WelcomeDriverDetailsState extends Equatable {
  const WelcomeDriverDetailsState({
     this.fullName = const Name.pure(),
    this.email = const Email.pure(),
    this.cityId = '',
    this.phoneNumber = const MobileNumber.pure(),
    this.city = const City.pure(),
    this.referralCode = const ReferralCode.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
    this.isAgree = false,
  });

  @override
  String toString() {
    return 'WelcomeDriverDetailsState{ username: ${fullName.value} & ${fullName.isValid}, email: ${email.isValid}, city: ${city.value} ${city.isValid}, phoneNumber: ${phoneNumber.value} ${phoneNumber.isValid}, status: $status, errorMessage: $errorMessage, isValid: $isValid isAgree : $isAgree';
  }

   final Name fullName;
  final Email email;
  final MobileNumber phoneNumber;
  final City city;
  final ReferralCode referralCode;
  final FormzSubmissionStatus status;
  final String cityId;
  final String? errorMessage;

  final bool isValid;
  final bool isAgree;

  WelcomeDriverDetailsState copyWith({
    MobileNumber? phoneNumber,
    Name? fullName,
    Email? email,
    City? city,
    ReferralCode? referralCode,
    String? cityId,
    FormzSubmissionStatus? status,
    bool? isValid,
    bool? isAgree,
    String? errorMessage,
   }) {
    return WelcomeDriverDetailsState(
       fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      cityId: cityId ?? this.cityId,
      referralCode: referralCode ?? this.referralCode,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      isAgree: isAgree ?? this.isAgree,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [fullName, email, city, phoneNumber, status, isAgree];
}
