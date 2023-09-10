import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../export.dart';

class FitnessCertificateButton extends StatelessWidget {
  const FitnessCertificateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FitnessCertificateCubit, FitnessCertificateState>(
      builder: (context, state) {
        var cubit = context.watch<FitnessCertificateCubit>();
        return Wrap(
          children: [
            ElButton(
              text: 'Done',
              style: gideonRoman(color: kGolden),
              showLoading: state.status.isInProgress,
              onTap: state.isValid ?()=> cubit.done(context) : null,
            ),
          ],
        );
      },
    );
  }
}
