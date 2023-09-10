import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class SetPreferencesRoute {
  static GoRoute page() => GoRoute(
    path: Screen.setPreferences.path,
    name: Screen.setPreferences.toName,
    builder: (ctx, state) => const SetPreferences(),
  );
}