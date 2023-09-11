import 'export.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';

class StartApplicationRoute {
  static GoRoute page() => GoRoute(
        path: Screen.startApplication.path,
        name: Screen.startApplication.cName,
        builder: (ctx, state) => const StartApplication(),
      );
}
