import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/domain/repository/master_repository.dart';
import '../../../../package/package/package.dart';
import '../../../../utility/utility/utility.dart';
import 'export.dart';

class InitialTestPage extends StatelessWidget {
  const InitialTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => get<MasterRepository>(),
      child: BlocProvider(
        create: (context) => InitialTestBloc(get()),
        child:  Scaffold(
          appBar: _simpleAppBar(context),
          body: const InitialTestPageBody(),
          persistentFooterButtons:const  [InitialTestPageButton()],
        ),
      ),
    );
  }
}
SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(

    bgColor: Colors.transparent,//theme.colorScheme.background,
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw7),
    // buttons: [
    //   FavIcon(
    //     icon: Icons.more_vert,
    //     iconColor: theme.colorScheme.onSecondary,
    //     onTap: () async => await popUp(context, [
    //       profileMenu,
    //       logoutMenu,
    //     ]),
    //   ),
    // ],
  );
}
