import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 import '../package/package.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? bgColor;
  final String label;
  final Widget? title;
  final bool centerTitle;
  final Widget? leading;
  final double elevation;
  final VoidCallback? onLeadingTap;
  final TextStyle? style;
 final bool showBackIcon;
  final double tabBarHeight;
  final List<Widget>? buttons;
  final PreferredSizeWidget? tabBar;
  final Widget? flexibleSpace;
  const SimpleAppBar({
    super.key,
    this.label = '',
    this.title,
    this.bgColor,
    this.centerTitle = true,
    this.elevation = 0,
    this.leading,
    this.showBackIcon = false,
    this.style,
    this.buttons,
    this.onLeadingTap,
    this.tabBar,
    this.flexibleSpace,
    this.tabBarHeight = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(tabBarHeight);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      leading: leading,
      elevation: elevation,
      centerTitle: centerTitle,
      backgroundColor: bgColor,
      automaticallyImplyLeading: showBackIcon,
      title: title ?? Text(label, style: style),
      // backgroundColor: Theme.of(context).colorScheme.onBackground,
      actions: [...?buttons], flexibleSpace: flexibleSpace,
      bottom: tabBar,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: theme.colorScheme.primary,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light),
    );
  }
}

Widget leading(
  Widget widget, {
  OnTap? onPressed,
}) =>
    IconButton(
        onPressed: onPressed != null ? () => onPressed() : null, icon: widget);
