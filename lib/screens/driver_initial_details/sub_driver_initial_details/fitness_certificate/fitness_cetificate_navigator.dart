import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class FitnessCertificateRoute {
  static GoRoute page() => GoRoute(
    path: Screen.fitnessCertificate.path,
    name: Screen.fitnessCertificate.cName,
    builder: (ctx, state) => const FitnessCertificate(),
  );
}