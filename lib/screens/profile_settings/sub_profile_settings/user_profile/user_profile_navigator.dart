import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import '../edit_user_profile/export.dart';
import 'export.dart';
String editProfilePath = 'edit-profile-path';
String editProfileName = 'edit-profile-name';
class UserProfileRoute {
  static GoRoute page() => GoRoute(
        path: Screen.userProfile.path,
        name: Screen.userProfile.cName,
        builder: (ctx, state) => const UserProfile(),
        routes: [
          GoRoute(
            path: editProfilePath,
             name: editProfileName,
             builder: (ctx, state) => const EditUserProfile(),
          ),
        ],
      );
}
