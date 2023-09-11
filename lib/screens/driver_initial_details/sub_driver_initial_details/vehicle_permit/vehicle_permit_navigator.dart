import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import 'export.dart';

class VehiclePermitRoute {
  static GoRoute page() => GoRoute(
        path: Screen.vehiclePermit.path,
        name: Screen.vehiclePermit.cName,
        builder: (ctx, state) => const VehiclePermit(),
      );
}
