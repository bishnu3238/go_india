import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'export.dart';

class WelcomeDriverDetails extends StatelessWidget {
  final WelcomeDriverDetailsCubit cubit;

  const WelcomeDriverDetails({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        persistentFooterAlignment: AlignmentDirectional.center,
        appBar: welcomeDriverDetailsAppBar(context),
        body: const WelcomeDriverDetailsBody(),
        persistentFooterButtons: const [WelcomeDriverDetailsButton()],
      ),
    );
  }
}
