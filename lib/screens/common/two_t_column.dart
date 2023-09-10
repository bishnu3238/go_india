import 'package:flutter/material.dart';

import '../../package/package/package.dart';
import '../../utility/utility/utility.dart';

class TowFieldColumn extends StatelessWidget {
  final String title;
  final String hint;
  final String label;
  final String? errorText;
  final String? example;
  final bool readOnly;
  final String fieldValue;
  final VoidCallback? onTap;
  final FormFieldValidator? validator;
  final Function(String)? onChange;
  final TextCapitalization capitalization;
  final double radius;
  final TextStyle? hintStyle;
  final Widget? secondary;
  final Widget? prefix;
  final Widget? exm;
  final Widget? suffix;
  final Color? borderColor;
  final Color? fillColor;
  final TextInputType inputType;

  const TowFieldColumn(
      {super.key,
      this.title = '',
      this.hintStyle,
      this.hint = '',
      this.example,
      this.fieldValue = '',
      this.readOnly = false,
      this.fillColor,
      this.capitalization = TextCapitalization.none,
      this.label = '',
      this.onTap,
      this.prefix,
      this.suffix,
      this.exm,
      this.errorText,
      this.radius = 5,
      this.secondary,
      this.validator,
      this.borderColor = kGrey3,
      this.inputType = TextInputType.name,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(title, style: gideonRoman(weight: fw5)),
        const SizedBox(height: 12),
        secondary ??
            TextFormField(
              onTap: onTap,
              textCapitalization: capitalization,
              keyboardType: inputType,
              onChanged: onChange,
              readOnly: readOnly,
              validator: validator,
              initialValue: fieldValue,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              onSaved: (d) => FocusScope.of(context).nextFocus(),
              decoration: borderInputDecoration(
                fillColor: fillColor,
                hint: hint,
                label: label,
                example: example,
                exm: exm,
                errorText: errorText,
                hintStyle: hintStyle,
                context: context,
                prefix: prefix,
                suffix: suffix,
                radius: radius,
                borderColor: borderColor,
              ),
            ),
      ],
    );
  }
}
