import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/utility/utility/utility.dart';


SimpleAppBar simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(
    bgColor: theme.cardColor,
    leading: FavIcon(
      icon: Icons.arrow_back,
      onTap: () => context.pop(),
      iconColor: theme.shadowColor,
    ),
    centerTitle: false,
    label: Screen.driverLicenseNo.toTitle,
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw5),
  );
}
