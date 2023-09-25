import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/package/package/package.dart';

import '../../../utility/utility/utility.dart';
import '../export.dart';

class DriverInitialDetailsButton extends StatelessWidget {
  const DriverInitialDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverInitialDetailsCubit, DriverInitialDetailsState>(

      builder: (context, state) {

      state.isAllDone.log(); var cubit = context.watch<DriverInitialDetailsCubit>();
        return Wrap(
          children: [
            ElButton(
              text: 'Submit Application',
              style: gideonRoman(color: kGolden, weight: fw9),
              showLoading: state.status.isInProgress,
              onTap: state.isAllDone
                  ? () => cubit.done(context)
                  : null,
            ),
          ],
        );
      },
    );
  }
}
