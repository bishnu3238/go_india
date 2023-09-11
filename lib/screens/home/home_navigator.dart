import 'package:flutter/material.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_router/go_router.dart';
import '../../package/package/package.dart';
import 'export.dart';

class HomeNavigator {}

mixin HomeRoute {
  static GoRoute page() => GoRoute(
        path: Screen.home.path,
        name: Screen.home.cName,
        builder: (ctx, state) => const Home(),
      );

  openIndex(initialParams) => context.go(Screen.home.path);

  AppNavigator get navigator;
  BuildContext get context;
}
