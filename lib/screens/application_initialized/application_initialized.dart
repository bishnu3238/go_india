import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:go_india/screens/profile_settings/export.dart';

import '../../routes/app_routes.dart';
import '../../domain/store/store.dart';
import '../../package/package/package.dart';
import '../../utility/utility/utility.dart';

class ApplicationInitialized extends StatefulWidget {
  const ApplicationInitialized({super.key});

  @override
  State<ApplicationInitialized> createState() => _ApplicationInitializedState();
}

class _ApplicationInitializedState extends State<ApplicationInitialized> {
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    // TODO: create a instance of bloc and repositories;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (create) => DriverInitialDetailsCubit(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
          lazy: true,
        ),
        BlocProvider(
          create: (create) => ProfileSettingsCubit(getIt()),
          lazy: true,
        ),
      ],
      child: BlocBuilder<ThemeStore, ThemeState>(
        bloc: getIt<ThemeStore>(),
        builder: (context, state) {
          return MaterialApp.router(
            title: appTitle,
            themeMode: state.themeMode,
            theme: state.light.toTheme,
            darkTheme: state.dark.toTheme,
            routerConfig: AppRouter.router,
            restorationScopeId: appName,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
