import 'package:formz/formz.dart';

enum ReferralCodeValidationError {
  invalid
}

class ReferralCode extends FormzInput<String, ReferralCodeValidationError> {
  const ReferralCode.pure() : super.pure('');

  const ReferralCode.dirty([String value = '']) : super.dirty(value);

  static final _referralCodeRegExp = RegExp(r'^[a-zA-Z0-9]{6}$');

  @override
  ReferralCodeValidationError? validator(String? value) {
    return _referralCodeRegExp.hasMatch(value ?? '')
        ? null
        : ReferralCodeValidationError.invalid;
  }
}
