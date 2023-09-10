import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class IdentityDetailsRoute {
  static GoRoute page() => GoRoute(
    path: Screen.identity.path,
    name: Screen.identity.toName,
    builder: (ctx, state) => const IdentityDetails(),
  );
}