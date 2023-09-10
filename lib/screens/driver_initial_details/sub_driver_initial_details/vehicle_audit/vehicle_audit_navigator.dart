import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class VehicleAuditRoute {
  static GoRoute page() => GoRoute(
    path: Screen.vehicleAudit.path,
    name: Screen.vehicleAudit.toName,
    builder: (ctx, state) => const VehicleAudit(),
  );
}