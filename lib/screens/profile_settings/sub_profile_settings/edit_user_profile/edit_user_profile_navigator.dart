import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class EditUserProfileRoute {
  static GoRoute page() => GoRoute(
    path: Screen.editProfile.path,
    name: Screen.editProfile.cName,
    builder: (ctx, state) => const EditUserProfile(),
  );
}