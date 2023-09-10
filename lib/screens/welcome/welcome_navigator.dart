import 'package:go_router/go_router.dart';
import '../../routes/route_path.dart';
import '../../utility/utility/utility.dart';
import '../add_new_vehicle/export.dart';
import '../driver_initial_details/driver_initial_details.dart';
import 'export.dart';

String addVehiclePath = 'add-vehicle';
String driverInitialDetailsPath = 'driver-initial-details';

class WelcomeRoute {
  static GoRoute page() => GoRoute(
          path: Screen.welcome.path,
          name: Screen.welcome.toName,
          builder: (ctx, state) => Welcome(
                cubit: getIt<WelcomeCubit>(),
              ),
          routes: [
            GoRoute(
              path: addVehiclePath,

              builder: (ctx, state) => const AddNewVehicle(),
            ),
            GoRoute(
              path: driverInitialDetailsPath,

              builder: (ctx, state) => const DriverInitialDetails(),
            )
          ]);
}
