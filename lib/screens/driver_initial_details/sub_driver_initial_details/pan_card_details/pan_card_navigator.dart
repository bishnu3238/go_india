import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class PanCardRoute {
  static GoRoute page() => GoRoute(
    path: Screen.panCard.path,
    name: Screen.panCard.toName,
    builder: (ctx, state) => const PanCard(),
  );
}