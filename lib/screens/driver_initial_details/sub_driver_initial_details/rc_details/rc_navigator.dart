import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
 import 'export.dart';

class RcDetailsRoute {
  static GoRoute page() => GoRoute(
        path: Screen.rcCertificate.path,
        name: Screen.rcCertificate.toName,
        builder: (ctx, state) => const RcDetails(),
      );
}
