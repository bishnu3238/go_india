import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/utility/constant/colors.dart';

import '../../../package/package/package.dart';
import '../../../utility/constant/text_style.dart';
import '../../../utility/utility/utility.dart';
import '../export.dart';

class WelcomeDriverDetailsButton extends StatelessWidget {
  const WelcomeDriverDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeDriverDetailsCubit, WelcomeDriverDetailsState>(
        builder: (context, state) {
      var cubit = context.watch<WelcomeDriverDetailsCubit>();
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Wrap(
          children: [
            ElButton(
              text: 'Continue',
              style: gideonRoman(color: kGolden, weight: fw9),
              showLoading: state.status.isInProgress,
              onTap: cubit.state.isValid && cubit.state.isAgree
                  ? () => cubit.welcomeDriver(context)
                  : null,
            ),
          ],
        ),
      );
    });
  }
}
