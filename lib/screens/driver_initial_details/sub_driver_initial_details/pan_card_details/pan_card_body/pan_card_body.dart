import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/screens/common/two_t_column.dart';
import 'package:go_india/utility/utility/utility.dart';
import '../../../../../routes/route_path.dart';
import '../../../export.dart';

class PanCardBody extends StatelessWidget {
  const PanCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: ClearFocus(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              AutoSizeText(Screen.panCard.toTitle,
                  style: gideonRoman(weight: fw7, size: 20)),
              const SizedBox(height: 8),
              const AutoSizeText(panCardTextOne),
              const SizedBox(height: 20),
              const _PanNoInput(),
              const SizedBox(height: 20),
              const CardHeadingListTile(
                  leading: Icon(Icons.check), title: Text(pictureLengthText)),
              const SizedBox(height: 20),
              const _PickPanImage(label: "Upload Pan Card"),
            ],
          ),
        ),
      ),
    );
  }
}

class _PickPanImage extends StatelessWidget {
  const _PickPanImage({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<PanCardCubit>(context);
    return BlocBuilder<PanCardCubit, PanCardState>(
      builder: (context, state) {
        return ImagePicker(
            label: state.panImage.isNotEmpty ? 'PICKED' : label,
            iColor: state.panImage.isNotEmpty
                ? theme.colorScheme.tertiary
                : theme.colorScheme.onPrimaryContainer,
            onTap: () async => await cubit.pickPanImage(context));
      },
    );
  }
}

class _PanNoInput extends StatelessWidget {
  const _PanNoInput();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PanCardCubit>();
    return BlocBuilder<PanCardCubit, PanCardState>(builder: (context, state) {
      return TowFieldColumn(
        title: 'Pan Card Number',
        hint: 'Pan card no.',
        example: 'e.g: ABCDE5561A',
        capitalization: TextCapitalization.characters,
        onChange: cubit.changePanCard,
        errorText: state.panCard.displayError != null
            ? 'Enter valid pan card number'
            : null,
      );
    });
  }
}

const panCardTextOne =
    'Enter your pan card number and we\'ll get the required information from the NSD.';
