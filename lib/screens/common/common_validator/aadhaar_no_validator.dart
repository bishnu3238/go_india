import 'package:formz/formz.dart';

enum AadhaarNumberValidationError { invalid }

class AadhaarNumber extends FormzInput<String, AadhaarNumberValidationError> {
  const AadhaarNumber.pure() : super.pure('');

  const AadhaarNumber.dirty([String value = '']) : super.dirty(value);

  static final _aadhaarNumberRegExp = RegExp(r'^[0-9]{12}$');

  @override
  AadhaarNumberValidationError? validator(String? value) {
    return _aadhaarNumberRegExp.hasMatch(value ?? '')
        ? null
        : AadhaarNumberValidationError.invalid;
  }
}
