import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class SupportRoute {
  static GoRoute page() => GoRoute(
    path: Screen.support.path,
    name: Screen.support.toName,
    builder: (ctx, state) => const Support(),
  );
}