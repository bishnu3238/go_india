import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:go_router/go_router.dart';

import '../../../../package/package/package.dart';
import '../../../../routes/route_path.dart';
import '../../../../utility/utility/utility.dart';

class DrivingLicense extends StatelessWidget {
  const DrivingLicense({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => DrivingLicenseCubit(getIt(), getIt(),getIt(), getIt()),
      child: Scaffold(
        appBar: _simpleAppBar(context),
        body: const DrivingLicenseBody(),
        persistentFooterButtons: const [DrivingLicenseButton()],
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(
    bgColor: theme.colorScheme.background,
    leading: FavIcon(
      icon: Icons.arrow_back,
      onTap: () => context.pop(),
      iconColor: theme.shadowColor,
    ),
    centerTitle: false,
    label: Screen.driverLicenseNo.toTitle,
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw5),
  );
}

class DrivingLicenseButton extends StatelessWidget {
  const DrivingLicenseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrivingLicenseCubit, DrivingLicenseState>(
      builder: (context, state) {
        var cubit = context.watch<DrivingLicenseCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [
              ElButton(
                text: 'Done',
                style: gideonRoman(color: kGolden),
                showLoading: state.status.isInProgress,
                onTap: state.isValid ? () => cubit.done(context) : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
