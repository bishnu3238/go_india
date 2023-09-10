import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/routes/route_path.dart';
 import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:go_india/utility/utility/utility.dart';

class VehicleInsuranceBody extends StatelessWidget {
  const VehicleInsuranceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: Column(
          children: [
            const SizedBox(height: 10),
            AutoSizeText(Screen.vehicleInsurance.toTitle),
            const SizedBox(height: 15),
            const CardHeadingListTile(
              leading: Icon(Icons.check),
              title: Text(_uploadPictureText),
            ),
            const CardHeadingListTile(
              leading: Icon(Icons.check),
              title: Text(_uploadPictureTwo),
            ),
            const CardHeadingListTile(
              leading: Icon(Icons.check),
              title: Text(_uploadPictureThree),
            ),
            const CardHeadingListTile(
              leading: Icon(Icons.check),
              title: Text(pictureLengthText),
            ),
            const SizedBox(height: 25),
            Text(
              "Upload Vehicle Insurance",
              style: gideonRoman(weight: fw7),
            ),
            const SizedBox(height: 15),
            const _PickVehiclePermitImage(label: 'Vehicle Insurance'),
          ],
        ),
      ),
    );
  }
}

class _PickVehiclePermitImage extends StatelessWidget {
  const _PickVehiclePermitImage({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<VehicleInsuranceCubit>(context);
    return BlocBuilder<VehicleInsuranceCubit, VehicleInsuranceState>(
      builder: (context, state) {
        return ImagePicker(
            label: state.insuranceImage.isNotEmpty ? 'PICKED' : label,
            iColor: state.insuranceImage.isNotEmpty
                ? theme.colorScheme.tertiary
                : theme.colorScheme.onPrimaryContainer,
            onTap: () async => await cubit.pickInsuranceImage(context));
      },
    );
  }
}


const _uploadPictureText =
    'Upload clear  pictures of all sides  of your Vehicle insurance document';
const _uploadPictureTwo =
    'Incase you are  uploading an all india Tourist Permit, a insurance Authorization certificate would be also be needed';
const _uploadPictureThree =
    'Incase you are uploading  a State permit , authorization certificate is not required';