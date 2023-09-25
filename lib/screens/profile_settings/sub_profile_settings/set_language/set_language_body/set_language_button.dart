import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../export.dart';

class SetLanguageButton extends StatelessWidget {
  const SetLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetLanguageCubit, SetLanguageState>(
      builder: (context, state) {
        // var cubit = context.watch<SetLanguageCubit>();
        return Wrap(
          children: [
            ElButton(
              text: 'Next',
              style: gideonRoman(color: kGolden, weight: fw9),
              showLoading: state.status.isInProgress,
              onTap: ()=> context.pop(),
            ),
          ],
        );
      },
    );
  }
}
