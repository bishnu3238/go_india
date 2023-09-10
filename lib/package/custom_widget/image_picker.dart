import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../package/package.dart';
import '../../utility/utility/utility.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({
    super.key,
    this.color,
    this.iColor,
    this.radius,
    this.height,
    this.icon,
    this.label,
    this.onTap,
    this.padding = edgeInsets,
    this.margin = edgeInsets,
  });
  final Color? color;
  final Color? iColor;
  final double? radius;
  final double? height;
  final IconData? icon;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final String? label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: padding,margin: margin,
        height: height ?? getScreenHeight(kLayoutHeight * 1 / 10),
        decoration: BoxDecoration(
          color: color ?? theme.colorScheme.surfaceVariant.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: CustomPaint(
          painter: DashedBorderAllSidePainter(radius: 12),
          child: Center(
            child: Card(
              child: FavTextIcon(
                icon: icon ?? FontAwesomeIcons.solidImage,
                iconColor: iColor,
                label: label ?? 'SELECT IMAGE',
                style: gideonRoman(weight: fw7, color: iColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
