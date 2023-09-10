import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../../../../../package/package/package.dart';
import '../../../../common/common.dart';

class AadhaarCardBody extends StatelessWidget {
  const AadhaarCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    // var cubit = context.watch<AadhaarCardCubit>();

    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: BlocBuilder<AadhaarCardCubit, AadhaarCardState>(
            builder: (ctx, state) {
          return Column(
            children: [
              const SizedBox(height: 20),
              const ContainerImageShow(
                image: aadhaarImage,
                imgType: ImgType.local,
              ),
              CardHeadingListTile(
                leading: const Icon(Icons.check),
                title: Text(aadhaarPictureText, style: gideonRoman()),
              ),
              CardHeadingListTile(
                leading: const Icon(Icons.check),
                title: Text(pictureLengthText, style: gideonRoman()),
              ),
              const Divider(),
              const SizedBox(height: 15),
              Text("Upload Aadhaar Card", style: gideonRoman(weight: fw7)),
              const SizedBox(height: 10),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _PickAadhaarImage(label: "FRONT", isFont: true),
                  _PickAadhaarImage(label: 'BACK', isFont: false),
                ],
              ),
              const SizedBox(height: 15),
              const _AadhaarNumberInput(),
            ],
          );
        }),
      ),
    );
  }
}

class _PickAadhaarImage extends StatelessWidget {
  const _PickAadhaarImage({
    required this.isFont,
    required this.label,
  });
  final bool isFont;
  final String label;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<AadhaarCardCubit>(context);
    return BlocBuilder<AadhaarCardCubit, AadhaarCardState>(
        builder: (context, state) {
      return Expanded(
        child: ImagePicker(
            height: getScreenHeight(kLayoutHeight * 1 / 8),
            label: isFont
                ? state.aadhaarImageOne.isNotEmpty
                    ? 'PICKED'
                    : label
                : state.aadhaarImageTwo.isNotEmpty
                    ? 'PICKED'
                    : label,
            iColor: isFont
                ? state.aadhaarImageOne.isNotEmpty
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.onPrimaryContainer
                : state.aadhaarImageTwo.isNotEmpty
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.onPrimaryContainer,
            onTap: () async => isFont
                ? await cubit.pickImage(context)
                : await cubit.pickBackImage(context)),
      );
    });
  }
}

class _AadhaarNumberInput extends StatelessWidget {
  const _AadhaarNumberInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AadhaarCardCubit, AadhaarCardState>(
      builder: (context, state) {
        var cubit = context.read<AadhaarCardCubit>();
        return TowFieldColumn(
          title: 'Aadhaar Number',
          hint: 'Aadhaar Number',
          inputType: TextInputType.number,
          onChange: cubit.changeAadhaar,
          errorText: state.aadhaarNumber.displayError != null
              ? 'Enter valid aadhaar number'
              : null,
        );
      },
    );
  }
}

const aadhaarPictureText =
    'Upload clear pictures of both sides of aadhaar card';
const pictureLengthText =
    'Uploaded document should be less that 10 MB and it should belong to JPG, JPEG, PNG, PDF type only.';
