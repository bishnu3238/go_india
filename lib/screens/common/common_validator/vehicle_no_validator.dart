import 'package:formz/formz.dart';

enum VehicleNumberValidationError { invalid }

class VehicleNumber extends FormzInput<String, VehicleNumberValidationError> {
  const VehicleNumber.pure() : super.pure('');

  const VehicleNumber.dirty([String value = '']) : super.dirty(value);

  static final _vehicleNumberRegExp = RegExp(r'^[A-Z]{2}[0-9]{1,2}[A-Z]{0,2}[0-9]{4}[\s-]*$');

  @override
  VehicleNumberValidationError? validator(String? value) {
    return _vehicleNumberRegExp.hasMatch(value ?? '')
        ? null
        : VehicleNumberValidationError.invalid;
  }
}
