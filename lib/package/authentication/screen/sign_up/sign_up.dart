import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import '../../../../utility/utility/utility.dart';
import 'sign_up_body/sign_up_app_bar.dart';
import 'sign_up_body/sign_up_form.dart';
import 'sign_up_cubit.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignUpAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => SignUpCubit(get(),   get()),
          child: Builder(builder: (context) {
            return const SignUpForm();
          }),
        ),
      ),
    );
  }
}

class SignUpRoute {
  static GoRoute page() => GoRoute(
        path: Screen.signUp.path,
        name: Screen.signUp.cName,
        builder: (ctx, state) => const SignUpPage(),
      );
}
