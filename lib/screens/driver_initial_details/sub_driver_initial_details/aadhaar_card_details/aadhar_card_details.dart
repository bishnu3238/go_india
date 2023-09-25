import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/package/package/package.dart';
 import 'package:go_india/utility/utility/utility.dart';
 import 'export.dart';

class AadhaarCardDetails extends StatelessWidget {
  const AadhaarCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AadhaarCardCubit(get(), get(), get(), get()),
      child: Scaffold(
        appBar: _simpleAppBar(context),
        body: const AadhaarCardBody(),
        persistentFooterButtons: const [AadhaarNoDetailsButton()],
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(
   centerTitle: false,
    label: 'Aadhaar Card Details',
    bgColor: theme.colorScheme.background,
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw5),
  );
}

class AadhaarNoDetailsButton extends StatelessWidget {
  const AadhaarNoDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AadhaarCardCubit, AadhaarCardState>(
      builder: (context, state) {
        var cubit = context.watch<AadhaarCardCubit>();
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [
              ElButton(
                text: 'Done',
                style: gideonRoman(color: kGolden, weight: fw9),
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
