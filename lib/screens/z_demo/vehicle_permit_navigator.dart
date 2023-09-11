import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class DemoRoute {
  static GoRoute page() => GoRoute(
    path: Screen.splash.path,
    name: Screen.splash.cName,
    builder: (ctx, state) => const Demo(),
  );
}