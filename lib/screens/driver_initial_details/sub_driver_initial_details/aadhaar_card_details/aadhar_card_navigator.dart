import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import 'export.dart';

class AadhaarCardDetailsRoute {
  static GoRoute page() => GoRoute(
        path: Screen.aadharCard.path,
        name: Screen.aadharCard.toName,
        builder: (ctx, state) => const AadhaarCardDetails(),
      );
}
