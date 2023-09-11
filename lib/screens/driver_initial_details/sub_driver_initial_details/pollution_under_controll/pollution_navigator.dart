import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class PollutionRoute {
  static GoRoute page() => GoRoute(
    path: Screen.pollutionUnderControl.path,
    name: Screen.pollutionUnderControl.cName,
    builder: (ctx, state) => const Pollution(),
  );
}