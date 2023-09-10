import 'package:auto_size_text/auto_size_text.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/screens/welcome_driver_details/export.dart';

import '../../../utility/utility/utility.dart';

class AgreeCheck extends StatelessWidget {
  const AgreeCheck({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<WelcomeDriverDetailsCubit>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: cubit.state.isAgree,
          fillColor: const MaterialStatePropertyAll(kGolden),
          onChanged: (bool? change) => cubit.toggleAgreeCheck(change ?? false),
        ),
        Expanded(
          child: AutoSizeText(
            "By continuing, you agree to GoIndia’s Terms & Conditions",
            style: gideonRoman(weight: fw6, size: 12),
          ),
        ),
      ],
    );
  }
}
