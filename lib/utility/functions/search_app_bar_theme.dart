import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utility/utility.dart';

ThemeData get  searchAppBarThemeData =>ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    shadowColor: Colors.yellowAccent,
    iconTheme: IconThemeData(color: kDBlue),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: kLight,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: kGrey.withOpacity(0.3),
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 12, 10),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: kDBlue),
      borderRadius: BorderRadius.circular(30.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  ),
);