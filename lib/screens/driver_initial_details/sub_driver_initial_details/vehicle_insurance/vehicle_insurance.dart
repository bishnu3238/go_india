import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'export.dart';

class VehicleInsurance extends StatelessWidget {
  const VehicleInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => VehicleInsuranceCubit(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
      child: Scaffold(
        appBar: _simpleAppBar(context),
        body: const VehicleInsuranceBody(),
        persistentFooterButtons: const [VehicleInsuranceButton()],
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(
    bgColor: theme.cardColor,
    leading: FavIcon(
      icon: Icons.arrow_back,
      onTap: () => context.pop(),
      iconColor: theme.shadowColor,
    ),
    centerTitle: false,
    label: Screen.vehicleInsurance.toTitle,
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw5),
  );
}
