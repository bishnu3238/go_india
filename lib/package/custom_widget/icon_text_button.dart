import 'package:flutter/material.dart';

import '../../utility/utility/utility.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    this.icon,
    this.text,
    this.style,
    this.button,
  });

  final IconData? icon;
  final String? text;
  final TextStyle? style;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon == null
            ? const SizedBox()
            : Padding(
          padding: edgeInsets1505,
          child: Icon(icon),
        ),
        text == null ? const SizedBox():  Text(
          text!,
          style: style ?? gideonRoman(),
        ),
        button == null ? const SizedBox() : const Spacer(),
        button ?? const SizedBox(),
      ],
    );
  }
}
