import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'export.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

class FitnessCertificate extends StatelessWidget {
  const FitnessCertificate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => FitnessCertificateCubit(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
      child: Scaffold(
        appBar: _simpleAppBar(context),
        body: const FitnessCertificateBody(),
        persistentFooterButtons: const [FitnessCertificateButton()],
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(
    bgColor: theme.colorScheme.background,

    centerTitle: false,
    label: 'Fitness Certificate Details',
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw5),
  );
}
