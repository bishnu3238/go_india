import 'package:auto_size_text/auto_size_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_india/utility/constant/constant.dart';
import '../../../package/package/package.dart';
import '../../common/app_bar_logo.dart';

SimpleAppBar welcomeDriverDetailsAppBar()=> SimpleAppBar(
  centerTitle: false,
  title: const AppBarLogo(),
  flexibleSpace: Padding(
    padding: edgeInsets5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AutoSizeText(
          'Welcome partner! Drive, Earn, Repeat',
          maxLines: 2,
          style: gideonRoman(
              color: FlexColor.amberDarkPrimary,
              size: getScreenWidth(kLayoutWidth * 1 / 18),
              weight: fwb),
        ),
        Text(
          'Please enter your details.',
          style: gideonRoman(color: FlexColor.amberDarkPrimary),
        )
      ],
    ),
  ),
  tabBarHeight: getScreenHeight(kLayoutHeight * 1 / 5.5),
);