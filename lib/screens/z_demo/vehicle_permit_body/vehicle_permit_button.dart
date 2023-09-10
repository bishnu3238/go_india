import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../export.dart';

class DemoButton extends StatelessWidget {
  const DemoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DemoCubit, DemoState>(
      builder: (context, state) {
        var cubit = context.watch<DemoCubit>();
        cubit;
        return Wrap(
          children: [
            ElButton(
              text: 'Done',
              style: gideonRoman(color: kGolden),
              showLoading: state.status.isInProgress,
              onTap: null,
            ),
          ],
        );
      },
    );
  }
}
