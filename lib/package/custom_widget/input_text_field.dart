import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final bool readOnly;
  final bool autofocus;
  final bool obscureText;
  final VoidCallback? onTap;
  final String? initialValue;
  final Function(String)? onChanged;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const InputTextField({
    super.key,
    this.onTap,
    this.validator,
    this.onChanged,
    this.controller,
    this.initialValue,
    this.readOnly = false,
    this.autofocus = false,
    this.obscureText = false,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      validator: validator,
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: decoration,
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.blue,
      initialValue: initialValue,
      contextMenuBuilder: (ctx, i) => const Text('Hello World'),
    );
  }
}
