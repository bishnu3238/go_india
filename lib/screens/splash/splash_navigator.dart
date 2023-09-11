import 'package:flutter/cupertino.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_router/go_router.dart';

import '../../package/package/package.dart';
import '../../utility/utility/utility.dart';
import 'export.dart';

class SplashNavigator {

}

mixin SplashRoute {
  static GoRoute page() => GoRoute(
        path: Screen.splash.path,
        name: Screen.splash.cName,
        builder: (ctx, state) => Splash(cubit: getIt<SplashCubit>()),
      );



  openIndex(initialParams) => context.go(Screen.onBoarding.path);

  AppNavigator get navigator;
  BuildContext get context;
}
