import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../export.dart';

class IdentityDetailsButton extends StatelessWidget {
  const IdentityDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IdentityDetailsCubit, IdentityDetailsState>(
      builder: (context, state) {
        var cubit = context.watch<IdentityDetailsCubit>();
        return Wrap(
          children: [
            ElButton(
              text: 'Done',
              style: gideonRoman(color: kGolden),
              showLoading: state.status.isInProgress,
              onTap: state.isValid ? ()=>cubit.done(context) : null,
            ),
          ],
        );
      },
    );
  }
}
