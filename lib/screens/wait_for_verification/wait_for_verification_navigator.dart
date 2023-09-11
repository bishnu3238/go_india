import 'package:go_india/screens/profile_settings/export.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import 'export.dart';

class WaitForVerificationRoute {
  static GoRoute page() => GoRoute(
          path: Screen.waitForVerification.path,
          name: Screen.waitForVerification.cName,
          builder: (ctx, state) => const WaitForVerification(),
          routes: [
            GoRoute(
              path: 'userProfile',
              name: 'user-profile',
              // name: Screen.userProfile.toName,
              builder: (ctx, state) => const UserProfile(),
            ),
          ]);
}
