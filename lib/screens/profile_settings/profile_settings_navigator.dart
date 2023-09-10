import 'package:go_router/go_router.dart';
import '../../routes/route_path.dart';
 import 'export.dart';

class ProfileSettingsRoute {
  static GoRoute page() => GoRoute(
    path: Screen.profileSettings.path,
    name: Screen.profileSettings.toName,
    builder: (ctx, state) => const ProfileSettings(
     ),
  );
}
