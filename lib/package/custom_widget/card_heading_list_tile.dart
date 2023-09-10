import 'package:flutter/material.dart';
import 'package:go_india/package/common/screen_utils.dart';

import '../../utility/utility/utility.dart';

class CardHeadingListTile extends StatelessWidget {
  const CardHeadingListTile({
    super.key,
    this.label,
    this.leading,
    this.heading,
    this.title,
    this.subtitle,
    this.tileAlign = ListTileTitleAlignment.titleHeight,
    this.trailing,
    this.color,
    this.onTap,
    this.elevation = 0,
    this.radius = 5,
  });
  final String? label;
  final Widget? heading;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Color? color;
  final double elevation;
  final double radius;
  final ListTileTitleAlignment? tileAlign;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        label == null
            ? heading ?? const SizedBox()
            : Text(label!, style: gideonRoman(weight: fw5)),
        const SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          margin: edgeInsets,
          elevation: elevation,
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)),
            horizontalTitleGap: 0,
            titleAlignment: tileAlign,
            dense: true,
            minLeadingWidth: getScreenWidth(kLayoutWidth * 1 / 11),
            onTap: onTap,
            leading: leading,
            title: title,
            subtitle: subtitle,
            trailing: trailing,
            tileColor: color ?? Theme.of(context).colorScheme.background,
          ),
        )
      ],
    );
  }
}
