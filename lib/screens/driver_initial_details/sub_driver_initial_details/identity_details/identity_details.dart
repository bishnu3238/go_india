import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'export.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

class IdentityDetails extends StatelessWidget {
  const IdentityDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => IdentityDetailsCubit(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
      child: Scaffold(
        appBar: _simpleAppBar(context),
        body: const IdentityDetailsBody(),
        persistentFooterButtons: const [IdentityDetailsButton()],
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(
    bgColor: theme.colorScheme.background,
    centerTitle: false,
    label: 'Identity Details',
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw5),
  );
}
