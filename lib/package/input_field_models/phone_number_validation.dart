import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid }

class MobileNumber extends FormzInput<String, PhoneNumberValidationError> {
  const MobileNumber.pure() : super.pure('');

  const MobileNumber.dirty([String value = '']) : super.dirty(value);

  static final _phoneNumberRegExp = RegExp(r'^[0-9]{10}$');

  @override
  PhoneNumberValidationError? validator(String? value) {
    return _phoneNumberRegExp.hasMatch(value ?? '')
        ? null
        : PhoneNumberValidationError.invalid;
  }
}

extension PhoneNoWithCountryCode on MobileNumber{
  String get phoneNoWithCountryCode => "+91 $value";
}
