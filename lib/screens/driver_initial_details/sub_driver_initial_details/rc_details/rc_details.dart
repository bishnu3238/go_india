import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/package/package/package.dart';
 import 'package:go_india/utility/utility/utility.dart';
 import 'export.dart';

class RcDetails extends StatelessWidget {
  const RcDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RcCubit(getIt(), getIt(), getIt(), getIt()),
      child: Scaffold(
        appBar: _simpleAppBar(context),
        body: const RcBody(),
        persistentFooterButtons: const [RcDetailsButton()],
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(

    centerTitle: false,
    label: 'R C Certificate',
    bgColor: theme.colorScheme.background,
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw5),
  );
}

class RcDetailsButton extends StatelessWidget {
  const RcDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RcCubit, RcState>(
      builder: (context, state) {
        var cubit = context.watch<RcCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [
              ElButton(
                text: 'Done',
                style: gideonRoman(color: kGolden),
                showLoading: state.status.isInProgress,
                onTap: state.isValid ? () => cubit.done(context) : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
