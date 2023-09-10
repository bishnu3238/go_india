import 'package:go_router/go_router.dart';
import '../../routes/route_path.dart';
 import 'export.dart';

class DriverInitialDetailsRoute {
  static GoRoute page() => GoRoute(
        path: Screen.driverInitialDetails.path,
        name: Screen.driverInitialDetails.toName,
        builder: (ctx, state) => const DriverInitialDetails(),

      );
}
