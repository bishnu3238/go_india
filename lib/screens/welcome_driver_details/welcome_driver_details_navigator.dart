 import 'package:go_router/go_router.dart';
import '../../routes/route_path.dart';
import '../../utility/utility/utility.dart';
import 'export.dart';

class WelcomeDriverRoute {
  static GoRoute page() => GoRoute(
        path: Screen.welcomeDriverDetails.path,
        name: Screen.welcomeDriverDetails.cName,
        builder: (ctx, state) => WelcomeDriverDetails(
          cubit: get<WelcomeDriverDetailsCubit>(),
        ),
      );
}
