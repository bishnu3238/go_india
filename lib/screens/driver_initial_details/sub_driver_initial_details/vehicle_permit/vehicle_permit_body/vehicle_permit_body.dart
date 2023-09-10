import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/screens/common/two_t_column.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:go_india/utility/utility/utility.dart';

class VehiclePermitBody extends StatelessWidget {
  const VehiclePermitBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: Column(
          children: [
            const SizedBox(height: 10),
            AutoSizeText(Screen.vehiclePermit.toTitle),
            const SizedBox(height: 15),
            const CardHeadingListTile(
              leading: Icon(Icons.check),
              title: Text(uploadPictureText),
              tileAlign: ListTileTitleAlignment.top,
            ),
            const CardHeadingListTile(
              leading: Icon(Icons.check),
              title: Text(uploadPictureTwo),
              tileAlign: ListTileTitleAlignment.top,
            ),
            const CardHeadingListTile(
              leading: Icon(Icons.check),
              title: Text(uploadPictureThree),
              tileAlign: ListTileTitleAlignment.top,
            ),
            const CardHeadingListTile(
              leading: Icon(Icons.check),
              title: Text(pictureLengthText),
              tileAlign: ListTileTitleAlignment.top,
            ),
            const SizedBox(height: 10),
            const _VehicleIssuedDetails(),
            const _VehiclePermitUpload(),
          ],
        ),
      ),
    );
  }
}

class _VehiclePermitUpload extends StatelessWidget {
  const _VehiclePermitUpload();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclePermitCubit, VehiclePermitState>(
        builder: (context, state) {
      return state.isPermitIssued == YesNo.yes
          ? const _UploadPermit()
          : const _UploadForm7();
    });
  }
}

class _UploadForm7 extends StatelessWidget {
  const _UploadForm7();

  @override
  Widget build(BuildContext context) {
    return TowFieldColumn(
      title: 'Upload TR-Form7 with seal and stamp',
      secondary: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "TR Form7 issue date should be clear and readable",
            style: gideonRoman(),
          ),
          const SizedBox(height: 5),
          const _PickVehiclePermitImage(label: 'Upload'),
        ],
      ),
    );
  }
}

class _UploadPermit extends StatelessWidget {
  const _UploadPermit();

  @override
  Widget build(BuildContext context) {
    return const TowFieldColumn(
      title: 'Upload Vehicle Permit',
      secondary: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          _PickVehiclePermitImage(label: 'Upload'),
        ],
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
    var cubit = BlocProvider.of<VehiclePermitCubit>(context);
    return BlocBuilder<VehiclePermitCubit, VehiclePermitState>(
      builder: (context, state) {
        return ImagePicker(
          label: state.vehiclePermitImage.isNotEmpty
              ? 'PICKED'
              : state.form7Image.isNotEmpty
                  ? 'Picked'
                  : label,
          iColor: state.vehiclePermitImage.isNotEmpty
              ? theme.colorScheme.tertiary
              : state.form7Image.isNotEmpty
                  ? theme.colorScheme.tertiary
                  : theme.colorScheme.onPrimaryContainer,
          onTap: state.isPermitIssued == YesNo.yes
              ? () async => await cubit.pickPermitImage(context)
              : () async => await cubit.pickForm7Image(context),
        );
      },
    );
  }
}

class _VehicleIssuedDetails extends StatelessWidget {
  const _VehicleIssuedDetails();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<VehiclePermitCubit>();
    return BlocBuilder<VehiclePermitCubit, VehiclePermitState>(
      builder: (context, state) {
        return CardHeadingListTile(
          title: Text('Is your vehicle permit issued',
              style: gideonRoman(size: 14, weight: fw7)),
          subtitle: RadioButtons(
            enums: YesNo.values,
            groupValue: state.isPermitIssued,
            onChange: cubit.changeIsVehicleIssued,
          ),
        );
      },
    );
  }
}

const uploadPictureText =
    'Upload clear  pictures of all sides  of your Vehicle Permit document';
const uploadPictureTwo =
    'Incase you are  uploading an all india Tourist Permit, a permit Authorization certificate would be also be needed';
const uploadPictureThree =
    'Incase you are uploading  a State permit , authorization certificate is not required';
