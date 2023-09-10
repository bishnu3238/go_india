import 'package:flutter/material.dart';

class IIcon extends StatelessWidget {
  const IIcon({super.key, this.icon, this.color, this.size = 15});
  final IconData? icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Icon(
      icon,
      size: size,
      color: color ?? theme.colorScheme.inverseSurface,
    );
  }
}
