import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:go_india/package/package/package.dart';

import '../../../../../utility/utility/utility.dart';
import '../export.dart';

class InitialTestPageButton extends StatelessWidget {
  const InitialTestPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialTestBloc, InitialTestState>(

      builder: (context, state) {

        // state.isAllDone.log();
        var cubit = context.watch<InitialTestBloc>();
        return Wrap(
          children: [
            ElButton(
              text: 'Next',
              style: gideonRoman(color: kGolden, weight: fw9),
              // showLoading: state.status.isInProgress,
              onTap:  null,
            ),
          ],
        );
      },
    );
  }
}
