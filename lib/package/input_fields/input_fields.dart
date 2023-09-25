import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../utility/utility/utility.dart';
import '../package/package.dart';

class PhoneInputField extends StatefulWidget {
  final String hint;
  final bool readOnly;
  final String? error;
  final String? label;
  final String? initialNumber;
  final Function(String) onDone;
  final TextEditingController? phone;
  final FormFieldValidator? validator;
  final Function(Country) onCountryChange;
  final Function(PhoneNumber) onNumberChange;

  const PhoneInputField({
    Key? key,
    this.phone,
    this.label,
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
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return IntlPhoneField(

      enabled: true,
       controller: widget.phone, //?? TextEditingController(text: widget.initialNumber),
      readOnly: widget.readOnly,
      showCountryFlag: true,
      initialCountryCode: "IN",
      initialValue: widget.initialNumber,
      invalidNumberMessage: widget.error,
      cursorColor: Colors.blue.shade700,
      textAlign: TextAlign.justify,
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonPadding: const EdgeInsets.only(left: 8),
      decoration: InputDecoration(
        enabled: true,
        isDense: true,
        hintText: widget.hint,
        labelText: widget.label,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
        labelStyle: theme.titleSmall!.copyWith(color: kDBlue),
        disabledBorder: OutlineInputBorder(borderRadius: radius12),
      ),
      onChanged: widget.onNumberChange,
      onCountryChanged: widget.onCountryChange,
      onSubmitted: widget.onDone,
    );
  }
}
