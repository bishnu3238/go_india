import 'package:formz/formz.dart';

enum DrivingLicenseValidationError { invalid }

class DLNumber extends FormzInput<String, DrivingLicenseValidationError> {
  const DLNumber.pure() : super.pure('');

  const DLNumber.dirty([String value = '']) : super.dirty(value);

  // static final _drivingLicenseRegExp = RegExp(r'^[A-Z0-9\-]{8,16}$');
  static final _drivingLicenseRegExp =
      RegExp(r'^[A-Z]{2}[0-9]{2}[0-9]{4}[0-9]{7}$');

  @override
  DrivingLicenseValidationError? validator(String? value) {
    return _drivingLicenseRegExp.hasMatch(value ?? '')
        ? null
        : DrivingLicenseValidationError.invalid;
  }
}
