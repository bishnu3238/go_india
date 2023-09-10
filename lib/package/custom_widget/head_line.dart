import 'package:flutter/material.dart';

import '../../utility/utility/utility.dart';
import '../package/package.dart';

class HeadLine extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final Widget? button;
  final String headline;
  final TextStyle? style;
  const HeadLine({
    super.key,
    this.icon,
    this.style,
    this.button,
    this.color = kLight,
    required this.headline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.fromLTRB(10, 8, 5, 5),
      color: color,
      child: IconTextButton(icon: icon, text: headline, style: style, button: button),
    );
  }
}

