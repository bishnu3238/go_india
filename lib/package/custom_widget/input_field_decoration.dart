import 'package:flutter/material.dart';

import '../../utility/utility/utility.dart';

InputDecoration borderInputDecoration({
  required BuildContext context,
  String? hint,
  String? label,
  Widget? prefix,
  String? example,
  Widget? exm,

  String? errorText,
  TextStyle? hintStyle,
  Widget? suffix,
  double? radius = 12,
  Color? borderColor = kDBlue,
  Color? fillColor,
}) {
  return InputDecoration(
    alignLabelWithHint: true,
    fillColor: fillColor,
    filled: fillColor != null ? true:false,
    hintText: hint,
    labelText: label,
    prefixIcon: prefix,
    suffixIcon: suffix,
    counterText: example,
    counter: example  == null ? exm: null,
    errorText: errorText,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: hintStyle ?? Theme.of(context).textTheme.bodySmall,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor!),
      borderRadius: BorderRadius.circular(radius!),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor),
      borderRadius: BorderRadius.circular(radius),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
    prefixIconConstraints: const BoxConstraints(
      maxWidth: 150,
      maxHeight: 50,
      minWidth: 38,
      minHeight: 38,
    ),
  );
}

InputDecoration inputFieldDecoration({
  required BuildContext context,
  String hint = '',
  String label = '',
  Widget? prefix,
  Widget? suffix,
  Widget? counter,
  TextStyle? hintStyle,
  double radius = 12,
  Color borderColor = kPrimeColor,
  Color errorBorderColor = kRed,
  Color disableBorderColor = kGreyForm,
}) {
  return InputDecoration(
    isDense: true,
    hintText: hint,
    hintStyle: hintStyle ?? Theme.of(context).textTheme.bodySmall,
    counter: counter,
    labelText: label,
    prefixIcon: prefix,
    suffixIcon: suffix,
    alignLabelWithHint: true,
    contentPadding: const EdgeInsets.all(15),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: disableBorderColor),
        borderRadius: BorderRadius.circular(radius)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(radius)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(radius)),
    prefixIconConstraints: const BoxConstraints(
      maxWidth: 150,
      maxHeight: 50,
      minWidth: 35,
      minHeight: 35,
    ),
  );
}
