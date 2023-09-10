import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/screens/common/two_t_column.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';

class FitnessCertificateBody extends StatelessWidget {
  const FitnessCertificateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: edgeInsets20,
        child: Column(
          children: [
            SizedBox(height: 10),
            SizedBox(height: 15),
            CardHeadingListTile(
              tileAlign: ListTileTitleAlignment.top,
              leading: Icon(Icons.check),
              title: Text(pictureLengthText),
            ),
            SizedBox(height: 10),
            TowFieldColumn(
              title: 'Upload Fitness Certificate',
              secondary: _PickFitnessCertificateImage(label: 'Upload'),
            )
          ],
        ),
      ),
    );
  }
}

class _PickFitnessCertificateImage extends StatelessWidget {
  const _PickFitnessCertificateImage({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<FitnessCertificateCubit>(context);
    return BlocBuilder<FitnessCertificateCubit, FitnessCertificateState>(
      builder: (context, state) {
        return ImagePicker(
            label: state.fitnessImage.isNotEmpty ? 'PICKED' : label,
            iColor: state.fitnessImage.isNotEmpty
                ? theme.colorScheme.tertiary
                : theme.colorScheme.onPrimaryContainer,
            onTap: () async => await cubit.pickFitnessImage(context));
      },
    );
  }
}
