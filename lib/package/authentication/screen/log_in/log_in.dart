import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import '../../../../utility/utility/utility.dart';
import 'log_in_body/login_app_bar.dart';
import 'log_in_cubit.dart';
import 'log_in_body/log_in_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogInAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginCubit(getIt(), getIt(),getIt(), getIt()),
          child: Builder(builder: (context) {
            return const LoginForm();
          }),
        ),
      ),
    );
  }
}

class LoginRoute {
  static GoRoute page() => GoRoute(
        path: Screen.login.path,
        name: Screen.login.toName,
        builder: (ctx, state) => const LoginPage(),
      );
}
