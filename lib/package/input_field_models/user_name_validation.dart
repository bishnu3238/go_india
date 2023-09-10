import 'package:formz/formz.dart';

 enum UsernameValidationError {
   invalid
}

 class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty([String value = '']) : super.dirty(value);

  static final _usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{3,20}$');

  @override
  UsernameValidationError? validator(String? value) {
    return _usernameRegExp.hasMatch(value ?? '')
        ? null
        : UsernameValidationError.invalid;
  }
}


