import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/utility/utility.dart';
import '../../../package/package.dart';

class Registration extends StatelessWidget {
  final PreferredSizeWidget appbar;

  const Registration({super.key, required this.appbar});

  @override
  Widget build(BuildContext context) {
    return ClearFocus(
      child: Scaffold(
        appBar: appbar,
        body: Padding(
            padding: edgeInsets10,
            child: BlocProvider(
              create: (ctx) => RegisterCubit(get<UserAuthRepository>(), get<Notifier>()),
              child: const RegistrationForm(),
            )),
      ),
    );
  }
}
