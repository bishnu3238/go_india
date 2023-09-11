import 'package:go_router/go_router.dart';

import '../../../../routes/route_path.dart';
import 'export.dart';

class BankAccountDetailsRoute {
  static GoRoute page() => GoRoute(
    path: Screen.bankAccountDetails.path,
    name: Screen.bankAccountDetails.cName,
    builder: (ctx, state) => const BankAccountDetails(),
  );
}
