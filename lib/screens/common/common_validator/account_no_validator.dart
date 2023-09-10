import 'package:formz/formz.dart';


enum BankAccountNoValidationError { invalid }

class BankAccountNo extends FormzInput<String, BankAccountNoValidationError> {
  const BankAccountNo.pure() : super.pure('');

  const BankAccountNo.dirty([String value = '']) : super.dirty(value);

  static final _bankAccountNoRegExp = RegExp(r'^[0-9]{9,18}$');

  @override
  BankAccountNoValidationError? validator(String? value) {
    return _bankAccountNoRegExp.hasMatch(value ?? '')
        ? null
        : BankAccountNoValidationError.invalid;
  }
}
