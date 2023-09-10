import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import 'export.dart';

class DrivingLicenseRoute {
  static GoRoute page() => GoRoute(
        path: Screen.driverLicenseNo.path,
        name: Screen.driverLicenseNo.toName,
        builder: (ctx, state) => const DrivingLicense(),
      );
}
