import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../package/package.dart';
import '../../../../screens/common/common.dart';
import '../../../../utility/utility/utility.dart';
import 'export.dart';

class OtpPage extends StatelessWidget {
  final OtpPageInitialParams params;
  const OtpPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: const SimpleAppBar(title: AppBarLogo(), centerTitle: false),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => OtpCubit(getIt(),  getIt(),getIt(), params),
          child: const OtpBody(),
        ),
      ),
    );
  }
}
