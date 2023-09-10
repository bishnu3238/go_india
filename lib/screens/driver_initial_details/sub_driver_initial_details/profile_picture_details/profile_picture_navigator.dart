import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class ProfilePictureRoute {
  static GoRoute page() => GoRoute(
    path: Screen.profilePicture.path,
    name: Screen.profilePicture.toName,
    builder: (ctx, state) => const ProfilePicture(),
  );
}