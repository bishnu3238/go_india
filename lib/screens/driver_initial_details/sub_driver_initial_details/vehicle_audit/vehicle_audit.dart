import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'export.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

class VehicleAudit extends StatelessWidget {
  const VehicleAudit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => VehicleAuditCubit(
        get(),
        get(),
        get(),
        get(),
      ),
      child: Scaffold(
        appBar: _simpleAppBar(context),
        body: const VehicleAuditBody(),
        persistentFooterButtons: const [VehicleAuditButton()],
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(
    centerTitle: false,
    label: 'Vehicle Audit Details',
    bgColor: theme.colorScheme.background,
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw5),
  );
}
