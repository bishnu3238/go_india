import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
  import 'export.dart';

class SetLanguageRoute {
  static GoRoute page() => GoRoute(
    path: Screen.setLanguage.path,
    name: Screen.setLanguage.toName,
    builder: (ctx, state) => const SetLanguage(),
  );
}