import 'package:go_india/package/package/package.dart';

enum DateOfBirthValidationError { invalid, underAge, valid }

class DateOfBirth {
  final DateTime? _value;
  DateOfBirth(this._value);
  const DateOfBirth.dirty([this._value]);

  const DateOfBirth.empty() : _value = null;

  DateTime get date => _value ?? DateTime(1900);

  bool get isValid => _value == null && errorMessage != null ? false : true;

  String get value => _value == null ? '' : _value!.dmyString;

  String? get errorMessage => _value == null || _value == DateTime(1900)
      ? 'Enter your date of birth'
      : (DateTime.now().difference(_value!).inDays ~/ 365) < 18
          ? 'Must be at least 18 years old'
          : null;

  @override
  String toString() => 'DateOfBirth{_value: $_value, isValid: $isValid}';

  DateOfBirth copyWith({DateTime? date}) => DateOfBirth(date);

  DateOfBirthValidationError? validate(DateTime? value) {
    if (value == null) return DateOfBirthValidationError.valid;
    if (value == DateTime(1900)) return DateOfBirthValidationError.valid;
    final selectedDate = DateTime.tryParse(value.toString());
    final age = DateTime.now().difference(selectedDate!).inDays ~/ 365;
    if (age < 18) return DateOfBirthValidationError.underAge;
    return null;
  }
}
