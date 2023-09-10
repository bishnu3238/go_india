import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:go_india/utility/utility/utility.dart';

import '../../../../../package/package/package.dart';
import '../../../../common/common.dart';
import '../export.dart';

class DrivingLicenseBody extends StatelessWidget {
  const DrivingLicenseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Upload DL Photo",
              style: gQuan(weight: fw5),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _DLImage(label: "FRONT", isFont: true),
                SizedBox(width: 5),
                _DLImage(label: 'BACK', isFont: false),
              ],
            ),
            const SizedBox(height: 20),
            const _DlInput(),
            const _DOBInput(),
          ],
        ),
      ),
    );
  }
}

class _DLImage extends StatelessWidget {
  const _DLImage({
    required this.isFont,
    required this.label,
  });
  final bool isFont;
  final String label;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<DrivingLicenseCubit>(context);
    return BlocBuilder<DrivingLicenseCubit, DrivingLicenseState>(
        builder: (context, state) {
      return Expanded(
        child: ImagePicker(
            height: getScreenHeight(kLayoutHeight * 1 / 8),
            color: theme.colorScheme.tertiaryContainer.withOpacity(0.1),
            label: isFont
                ? state.dlImage.isNotEmpty
                    ? 'PICKED'
                    : label
                : state.dlBackImage.isNotEmpty
                    ? 'PICKED'
                    : label,
            iColor: isFont
                ? state.dlImage.isNotEmpty
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.onPrimaryContainer
                : state.dlBackImage.isNotEmpty
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.onPrimaryContainer,
            onTap: () async => isFont
                ? await cubit.pickImage(context)
                : await cubit.pickBackImage(context)),
      );
    });
  }
}

class _DlInput extends StatelessWidget {
  const _DlInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrivingLicenseCubit, DrivingLicenseState>(
      builder: (context, state) {
        var cubit = context.read<DrivingLicenseCubit>();
        return TowFieldColumn(
          title: 'Driving License Number',
          hint: 'Driving License No',
          example: 'e.g. DL1420110012345 ',
          capitalization: TextCapitalization.characters,
          onChange: cubit.changeDlNo,
          errorText: state.dlNumber.displayError != null
              ? 'Enter valid driving license number'
              : null,
        );
      },
    );
  }
}

class _DOBInput extends StatelessWidget {
  const _DOBInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrivingLicenseCubit, DrivingLicenseState>(
      builder: (context, state) {
        var cubit = context.read<DrivingLicenseCubit>();
        return TowFieldColumn(
          title: "Date of birth",
          secondary: SecondaryTextField(
            hint: state.dob.isValid ? state.dob.value : 'Date of birth',
            icon: FontAwesomeIcons.calendar,
            onTap: () => cubit.pickDOB(context),
            errorText: state.dob.errorMessage,
          ),
          inputType: TextInputType.number,
        );
      },
    );
  }
}
