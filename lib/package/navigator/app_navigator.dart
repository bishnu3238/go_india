import 'package:flutter/material.dart';

class AppNavigator {
  push(BuildContext context, Widget page) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => page),
      );
  pushName(BuildContext context, String page) =>
      Navigator.of(context).pushNamed(page);

  pop(BuildContext context, dynamic value) => Navigator.of(context).pop(value);

  popUntil(BuildContext context, String page) =>
      Navigator.of(context).popUntil(ModalRoute.withName(page));

  pushReplacement(BuildContext context, Widget page) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => page,
        ),
      );
  pushReplacementName(BuildContext context, String page) =>
      Navigator.of(context).pushReplacementNamed(page);

  pushAndRemoveUntil(BuildContext context, Widget page,
          {dynamic value = false}) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => page),
        (route) => value,
      );

  pushNamedAndRemoveUntil(BuildContext context, String page,
          {dynamic value = false}) =>
      Navigator.of(context).pushNamedAndRemoveUntil(
        page,
        (route) => value,
      );
}
