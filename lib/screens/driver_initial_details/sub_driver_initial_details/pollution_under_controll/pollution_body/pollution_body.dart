import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../../../export.dart';

class PollutionBody extends StatelessWidget {
  const PollutionBody({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = context.read<PollutionCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CardHeadingListTile(
                leading: Icon(Icons.check), title: Text(pollutionText)),
            const CardHeadingListTile(
                leading: Icon(Icons.check), title: Text(pictureLengthText)),
            const SizedBox(height: 30),
            Text(
              "Upload Pollution Certificate",
              style: gideonRoman(weight: fw7),
            ),
            const SizedBox(height: 10),
            const _PickVehicleImage(label: 'Upload', isFont: false),
          ],
        ),
      ),
    );
  }
}

class _PickVehicleImage extends StatelessWidget {
  const _PickVehicleImage({
    required this.isFont,
    required this.label,
  });
  final bool isFont;
  final String label;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<PollutionCubit>(context);
    return BlocBuilder<PollutionCubit, PollutionState>(
      builder: (context, state) {
        return ImagePicker(
            height: getScreenHeight(kLayoutHeight * 1 / 6),
            label: state.pollutionImage.isNotEmpty ? 'PICKED' : label,
            iColor: state.pollutionImage.isNotEmpty
                ? theme.colorScheme.tertiary
                : theme.colorScheme.onPrimaryContainer,
            onTap: () => cubit.selectPollutionImage(context));
      },
    );
  }
}

const pollutionText = 'Upload clear pictures of both sides of pollution card';
