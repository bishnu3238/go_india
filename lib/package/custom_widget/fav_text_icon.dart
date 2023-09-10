import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../utility/utility/utility.dart';
import '../package/package.dart';

class FavTextIcon<Argument, ReturnType> extends StatelessWidget {
  final Argument? params;
  final IconData icon;
  final double size;
  final String? label;
  final TextStyle? style;
  final Color? iconColor;
  final OnTap<ReturnType>? onTap;
  final OnIconPressed<Argument, ReturnType>? onIconPressed;

  const FavTextIcon({
    Key? key,
    this.onTap,
    this.params,
    this.label,
    this.style,
    required this.icon,
    this.onIconPressed,
    this.size = 24,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap ,
      child: Container(
        padding: edgeInsets5,
        margin: edgeInsets5,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: iconColor ?? theme.colorScheme.onPrimaryContainer,
              size: size,
            ),
            const SizedBox(width: 5),
            AutoSizeText(
              label ?? "",
              style: style ??
                  gideonRoman(
                      color: theme.colorScheme.onPrimaryContainer,
                      size: size * 3 / 4,
                      weight: fw5),
            )
          ],
        ),
      ),
    );
  }
}
