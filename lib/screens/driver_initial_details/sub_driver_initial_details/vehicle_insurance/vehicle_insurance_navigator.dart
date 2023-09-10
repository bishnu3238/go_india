import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class VehicleInsuranceRoute {
  static GoRoute page() => GoRoute(
    path: Screen.vehicleInsurance.path,
    name: Screen.vehicleInsurance.toName,
    builder: (ctx, state) => const VehicleInsurance(),
  );
}