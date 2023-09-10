import 'package:flutter/material.dart';

import '../../utility/utility/utility.dart';


class ScreenUtils {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

double getScreenWidth(double inputWidth) {
  double screenWidth = ScreenUtils.screenWidth;
  return (inputWidth / kLayoutWidth) * screenWidth;
}

double getScreenHeight(double inputHeight) {
  double screenHeight = ScreenUtils.screenHeight;
  return (inputHeight / kLayoutHeight) * screenHeight;
}
