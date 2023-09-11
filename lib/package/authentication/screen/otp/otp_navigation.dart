 import 'package:go_router/go_router.dart';
import 'export.dart';
import '../../../../routes/route_path.dart';

class OtpRoute {
  static GoRoute page() => GoRoute(
        path: Screen.otp.path,
        name: Screen.otp.cName,
        builder: (ctx, state) =>
            OtpPage(params: state.extra! as OtpPageInitialParams),
      );
}
