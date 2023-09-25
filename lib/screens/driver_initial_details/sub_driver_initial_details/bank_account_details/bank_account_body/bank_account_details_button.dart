import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
 import 'package:go_india/utility/constant/colors.dart';

import '../../../../../package/custom_button/el_button.dart';
import '../../../../../utility/constant/text_style.dart';
import '../export.dart';

class BankAccountDetailsButton extends StatelessWidget {
  const BankAccountDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankAccountDetailsCubit, BankAccountState>(
      builder: (context, state) {
        var cubit = context.watch<BankAccountDetailsCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [
              ElButton(
                text: 'Done',
                style: gideonRoman(color: kGolden, weight: fw9),
                showLoading: state.status.isInProgress,
                onTap: state.isValid && state.passbookImage.isNotEmpty
                    ? () => cubit.done(context)
                    : () => cubit.validatingMessage(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
