 import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';
import 'on_boarding.dart';

class OnBoardingRoute {
  static GoRoute page() =>    GoRoute(
    path: Screen.onBoarding.path,
    name: Screen.onBoarding.toName,
    builder: (ctx, state) => const Onboarding(),
  );
}
