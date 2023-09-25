import 'package:go_india/screens/profile_settings/export.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import 'export.dart';

class InitialTestPageRoute {
  static GoRoute page() => GoRoute(
        path: Screen.initialTestPage.subPath,
        name: Screen.initialTestPage.cName,
        builder: (ctx, state) => const InitialTestPage(),
      );
}
