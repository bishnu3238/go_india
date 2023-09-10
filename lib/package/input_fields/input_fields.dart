import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../utility/utility/utility.dart';
import '../package/package.dart';

class PhoneInputField extends StatelessWidget {
  final String hint;
  final bool readOnly;
  final String? error;
  final String? initialNumber;
  final Function(String) onDone;
  final TextEditingController? phone;
  final FormFieldValidator? validator;
  final Function(Country) onCountryChange;
  final Function(PhoneNumber) onNumberChange;

  const PhoneInputField({
    Key? key,
    this.phone,
    this.error,
    this.validator,
    this.initialNumber,
    required this.hint,
    required this.onDone,
    this.readOnly = false,
    required this.onNumberChange,
    required this.onCountryChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return IntlPhoneField(
      enabled: true,
      controller: phone,
      readOnly: readOnly,
      showCountryFlag: true,
      initialCountryCode: "IN",
      initialValue: initialNumber,
      invalidNumberMessage: error,
      cursorColor: Colors.blue.shade700,
      textAlign: TextAlign.justify,
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonPadding: const EdgeInsets.only(left: 8),
      decoration: InputDecoration(
        enabled: true,
        isDense: true,
        hintText: hint,
        labelText: 'Phone Number',
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
        labelStyle: theme.titleSmall!.copyWith(color: kDBlue),
        disabledBorder: OutlineInputBorder(borderRadius: radius12),
      ),
      onChanged: onNumberChange,
      onCountryChanged: onCountryChange,
      onSubmitted: onDone,
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) {},
      obscureText: true,
      decoration: inputFieldDecoration(context: context),
    );
  }
}
