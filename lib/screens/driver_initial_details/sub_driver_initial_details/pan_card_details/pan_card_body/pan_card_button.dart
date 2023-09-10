import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../export.dart';

class PanCardButton extends StatelessWidget {
  const PanCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PanCardCubit, PanCardState>(
      builder: (context, state) {
        var cubit = context.watch<PanCardCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [
              ElButton(
                text: 'Done',
                style: gideonRoman(color: kGolden),
                showLoading: state.status.isInProgress,
                onTap: state.isValid ? ()=> cubit.done(context): null,
              ),
            ],
          ),
        );
      },
    );
  }
}
