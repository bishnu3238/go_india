import 'package:formz/formz.dart';

enum VehicleNoValidationError { invalid }

class VehicleNo extends FormzInput<String, VehicleNoValidationError> {
  const VehicleNo.pure() : super.pure('');

  const VehicleNo.dirty([String value = '']) : super.dirty(value);

  static final _vehicleNumberRegExp =
      RegExp(r'^[a-zA-Z\s]{2,50}$', caseSensitive: false);
  // RegExp(
  // r'^[KA|KL|MH|TN|AP|GJ|HR|RJ|DL|MP|CH|JK|UT|AR|AS|BR|CT|GA|JH|KL|ML|MN|OR|PB|PY|RJ|SK|TG|UP|WB]\d{1,2}\s?[A-Z]{1,2}\d{4}$',
  // caseSensitive: false,
  // );

  @override
  VehicleNoValidationError? validator(String? value) {
    return _vehicleNumberRegExp.hasMatch(value ?? '')
        ? null
        : VehicleNoValidationError.invalid;
  }
}
