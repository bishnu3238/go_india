import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/screens/common/common.dart';
import '../../utility/utility/utility.dart';
import 'export.dart';

class Welcome extends StatelessWidget {
  final WelcomeCubit cubit;

  const Welcome({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<WelcomeCubit>(),
      child: const Scaffold(
        appBar: SimpleAppBar(centerTitle: false, title: AppBarLogo()),
        body: WelcomeBody(),
      ),
    );
  }
}
