import 'package:formz/formz.dart';

enum IFSCCodeValidationError { invalid }

class IFSCCode extends FormzInput<String, IFSCCodeValidationError> {
  const IFSCCode.pure() : super.pure('');

  const IFSCCode.dirty([String value = '']) : super.dirty(value);

  static final _ifscCodeRegExp = RegExp(r'^[A-Z]{4}[A-Z0-9]{7}$');

  @override
  IFSCCodeValidationError? validator(String? value) {
    return _ifscCodeRegExp.hasMatch(value ?? '')
        ? null
        : IFSCCodeValidationError.invalid;
  }
}
