import 'package:formz/formz.dart';

enum PanCardValidationError { invalid }

class PanCard extends FormzInput<String, PanCardValidationError> {
  const PanCard.pure() : super.pure('');

  const PanCard.dirty([String value = '']) : super.dirty(value);

  static final _panCardRegExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');

  @override
  PanCardValidationError? validator(String? value) {
    return _panCardRegExp.hasMatch(value ?? '')
        ? null
        : PanCardValidationError.invalid;
  }
}
