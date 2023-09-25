import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../package/package/package.dart';
import '../../utility/utility/utility.dart';
import '../common/common.dart';
import 'export.dart';

class AddNewVehicle extends StatelessWidget {
  const AddNewVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddNewVehicleCubit(get(), get(), get(), get(), get())
            ..init(),
      child: const Scaffold(
        appBar: SimpleAppBar(centerTitle: false, title: AppBarLogo()),
        body: AddNewVehicleBody(),
        persistentFooterButtons: [AddNewVehicleButton()],
      ),
    );
  }
}

class AddNewVehicleButton extends StatelessWidget {
  const AddNewVehicleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewVehicleCubit, AddNewVehicleState>(
        builder: (context, state) {
      var cubit = context.watch<AddNewVehicleCubit>();
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ElButton(
          text: 'Continue',
          style: gideonRoman(color: kGolden, weight: fw9),
          showLoading: state.status.isInProgress,
          onTap: cubit.state.isValid
              ? () => cubit.vehicleDetailsSubmit(context)
              : null,
        ),
      );
    });
  }
}
