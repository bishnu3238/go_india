import 'package:go_india/screens/add_new_vehicle/export.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';

class AddNewVehicleRoute {
  static GoRoute page() => GoRoute(
        path: Screen.addVehicle.path,
        name: Screen.addVehicle.cName,
        builder: (ctx, state) => const AddNewVehicle(),
      );
}
