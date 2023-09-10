import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/screens/common/common.dart';
 import 'export.dart';

class DriverInitialDetails extends StatelessWidget {
  const DriverInitialDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      appBar: simpleAppBar(context),
      body: const DriverInitialDetailsBody(),
      persistentFooterButtons: const [DriverInitialDetailsButton()],
    );
  }
}

SimpleAppBar simpleAppBar(BuildContext context) => SimpleAppBar(
      title: const AppBarLogo(),
      centerTitle: false,
      buttons: [
        FavIcon(
          icon: Icons.more_vert,
          onTap: () => context.read<DriverInitialDetailsCubit>().showPopUp(context),
        ),
      ],
    );
