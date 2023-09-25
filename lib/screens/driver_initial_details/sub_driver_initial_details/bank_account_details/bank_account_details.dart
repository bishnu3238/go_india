import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../package/package/package.dart';
import '../../../../utility/utility/utility.dart';
import 'export.dart';

class BankAccountDetails extends StatelessWidget {
  const BankAccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocProvider(
      create: (context) => BankAccountDetailsCubit(get(), get(), get()),
      child: Scaffold(
        appBar: _simpleAppBar(context, theme),
        body: const BankAccountDetailsBody(),
        persistentFooterButtons: const [BankAccountDetailsButton()],
      ),
    );
  }

  SimpleAppBar _simpleAppBar(BuildContext context, ThemeData theme) {
    return SimpleAppBar(
      bgColor: theme.colorScheme.background,
      buttons: const [
        FavTextIcon(icon: Icons.live_help_outlined, label: 'HELP', size: 20),
      ],
    );
  }
}
