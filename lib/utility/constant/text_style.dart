 import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const FontWeight fwb = FontWeight.bold;
const FontWeight fw2 = FontWeight.w200;
const FontWeight fw3 = FontWeight.w300;
const FontWeight fw5 = FontWeight.w500;
const FontWeight fw6 = FontWeight.w600;
const FontWeight fw7 = FontWeight.w700;
const FontWeight fw9 = FontWeight.w900;

gQuan({Color? color, double? size, FontWeight? weight, TextDecoration ?decoration}) => GoogleFonts.quando(
      color: color,
      fontSize: size,
      fontWeight: weight,
  decoration: decoration,
    );
gideonRoman(
        {Color? color,
        double? size,
        FontWeight? weight,
        TextDecoration? decoration}) =>
    GoogleFonts.gideonRoman(
        color: color,
        fontSize: size,
        fontWeight: weight,
        decoration: decoration);
inter(
        {Color? color,
        double? size,
        FontWeight? weight,
        TextDecoration? decoration}) =>
    GoogleFonts.inter(
        color: color,
        fontSize: size,
        fontWeight: weight,
        decoration: decoration);
roboto(
        {Color? color,
        double? size,
        FontWeight? weight,
        TextDecoration? decoration}) =>
    GoogleFonts.roboto(
        color: color,
        fontSize: size,
        fontWeight: weight,
        decoration: decoration);
