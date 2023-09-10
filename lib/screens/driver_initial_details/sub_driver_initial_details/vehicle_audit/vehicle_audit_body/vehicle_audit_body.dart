import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/screens/common/two_t_column.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';

class VehicleAuditBody extends StatelessWidget {
  const VehicleAuditBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: Column(
          children: [
            SizedBox(height: 15),
            CardHeadingListTile(tileAlign: ListTileTitleAlignment.top,
              leading: Icon(Icons.check),
              title: Text(pictureLengthText),
            ),
            SizedBox(height: 10),
            TowFieldColumn(
              title: 'Upload Vehicle Front Image',
              secondary: _PickVehicleImage(label: 'Front Image', isFont: true),
            ),
            TowFieldColumn(
              title: 'Upload Vehicle Back Image',
              secondary: _PickVehicleImage(label: 'Back Image', isFont: false),
            ),
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
    var cubit = BlocProvider.of<VehicleAuditCubit>(context);
    return BlocBuilder<VehicleAuditCubit, VehicleAuditState>(
        builder: (context, state) {
      return ImagePicker(
          height: getScreenHeight(kLayoutHeight * 1 / 8),
          label: isFont
              ? state.vehicleImageOne.isNotEmpty
                  ? 'PICKED'
                  : label
              : state.vehicleImageTwo.isNotEmpty
                  ? 'PICKED'
                  : label,
          iColor: isFont
              ? state.vehicleImageOne.isNotEmpty
                  ? theme.colorScheme.tertiary
                  : theme.colorScheme.onPrimaryContainer
              : state.vehicleImageTwo.isNotEmpty
                  ? theme.colorScheme.tertiary
                  : theme.colorScheme.onPrimaryContainer,
          onTap: () async => isFont
              ? await cubit.pickImage(context)
              : await cubit.pickBackImage(context));
    });
  }
}
