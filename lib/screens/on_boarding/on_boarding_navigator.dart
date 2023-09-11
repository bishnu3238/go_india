 import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';
import 'on_boarding.dart';

class OnBoardingRoute {
  static GoRoute page() =>    GoRoute(
    path: Screen.onBoarding.path,
    name: Screen.onBoarding.cName,
    builder: (ctx, state) => const Onboarding(),
  );
}
