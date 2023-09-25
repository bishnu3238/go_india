import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../export.dart';

class EditUserProfileButton extends StatelessWidget {
  const EditUserProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditUserProfileCubit, EditUserProfileState>(
      builder: (context, state) {
        var cubit = context.watch<EditUserProfileCubit>();
        cubit;
        return Wrap(
          children: [
            ElButton(
              text: 'Update',
              style: gideonRoman(color: kGolden, weight: fw9),
              showLoading: state.status.isInProgress,
              onTap: state.isValid ? ()=> cubit.update(context): null,
            ),
          ],
        );
      },
    );
  }
}
