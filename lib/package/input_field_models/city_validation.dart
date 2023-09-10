import 'package:formz/formz.dart';

enum CityValidationError { invalid }

class City extends FormzInput<String, CityValidationError> {
  const City.pure() : super.pure('');

  const City.dirty([String value = '']) : super.dirty(value);

  static final _cityRegExp = RegExp(r'^[a-zA-Z\s\-]{2,50}$');

  @override
  CityValidationError? validator(String? value) {
    return _cityRegExp.hasMatch(value ?? '')
        ? null
        : CityValidationError.invalid;
  }
}
