import 'package:formz/formz.dart';

enum FullNameValidationError {
  invalid
}

class Name extends FormzInput<String, FullNameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty([String value = '']) : super.dirty(value);

  static final _nameRegExp = RegExp(r'^[a-zA-Z\s]{2,50}$');

  @override
  FullNameValidationError? validator(String? value) {
    return _nameRegExp.hasMatch(value ?? '')
        ? null
        : FullNameValidationError.invalid;
  }
}
