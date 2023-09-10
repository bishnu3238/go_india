import 'package:flutter/material.dart';


class SilverAppBar extends StatelessWidget {
  final bool pinned;
  final bool floating;
  final Color? bgColor;
  final Widget? leading;
  final double elevation;
  final bool centerTitle;
  final Widget? titleWidget;
  final bool autoImplyLeading;
  final List<Widget>? actionButtons;
  final PreferredSizeWidget bottomWidget;

  SilverAppBar({
    super.key,
    this.leading,
    Widget? bottom,
    this.titleWidget,
    this.actionButtons,
    this.elevation = 2,
    this.pinned = true,
    this.floating = true,
    this.bgColor,
    this.centerTitle = true,
    this.autoImplyLeading = false,
  }) : bottomWidget = PreferredSize(
          preferredSize: bottom == null
              ? const Size(0.0, 0.0)
              : const Size(double.maxFinite, kToolbarHeight + 10),
          child: bottom ?? const SizedBox(),
        );

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      leading: leading,
      floating: floating,
      elevation: elevation,
      backgroundColor: bgColor,
      centerTitle: centerTitle,
      automaticallyImplyLeading: autoImplyLeading,
      title: titleWidget,
      actions: actionButtons,

      bottom: bottomWidget,
      // PreferredSize(
      //   preferredSize: Size(double.maxFinite, kToolbarHeight + 8),
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      //     // child: CustomTextField(
      //     //   hintText: 'Search ...',
      //     //   prefixIcon: FontAwesomeIcons.magnifyingGlass,
      //     //   suffixIcon: Container(
      //     //     decoration: BoxDecoration(
      //     //         color: Colors.lightBlueAccent.shade700,
      //     //         border: Border.all(color: Colors.black38),
      //     //         borderRadius: const BorderRadius.all(Radius.circular(25))),
      //     //     child: IconButton(
      //     //       onPressed: () {
      //     //         // TODO: search with microphone;
      //     //       },
      //     //       icon: FaIcon(
      //     //         FontAwesomeIcons.microphone,
      //     //         color: Colors.grey[50],
      //     //       ),
      //     //     ),
      //     //   ),
      //     //   readOnly: true,
      //     //   onTap: () async {
      //     //     // TODO: search all things in bioCellar;
      //     //   },
      //     // ),
      //   ),
      // ),
    );
  }
}
