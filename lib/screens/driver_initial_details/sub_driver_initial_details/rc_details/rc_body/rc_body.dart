import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../../../../../package/package/package.dart';
import '../../../../common/common.dart';

class RcBody extends StatelessWidget {
  const RcBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: BlocBuilder<RcCubit, RcState>(builder: (ctx, state) {
          return ClearFocus(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const _VehicleOwnerShip(),
                const SizedBox(height: 20),
                const RcNumberInput(),
                const Divider(),
                const SizedBox(height: 15),
                Text("Rc Certificate image", style: gideonRoman(weight: fw7)),
                const SizedBox(height: 10),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _PickAadhaarImage(label: "FRONT", isFont: true),
                    _PickAadhaarImage(label: 'BACK', isFont: false),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _VehicleOwnerShip extends StatelessWidget {
  const _VehicleOwnerShip();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RcCubit>();
    return BlocBuilder<RcCubit, RcState>(builder: (context, state) {
      return TowFieldColumn(
        title: 'Vehicle OwnerShip',
        secondary: DropdownButtonFormField(
          padding: edgeInsets,
          decoration: borderInputDecoration(context: context, radius: 5),
          borderRadius: BorderRadius.circular(20),
          hint: const Text('Vehicle Type'),
          items: [
            ...List.generate(
              RcType.values.length,
              (index) => DropdownMenuItem(
                value: index,
                child: Text(RcType.values[index].name.toUpperCase()),
              ),
            ).toList()
          ],
          onChanged: cubit.onChangeRc,
        ),
      );
    });
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
    var cubit = context.watch<RcCubit>();
    return BlocBuilder<RcCubit, RcState>(builder: (context, state) {
      return Expanded(
        child: ImagePicker(
            margin: edgeInsets5,
            color: theme.colorScheme.tertiary.withOpacity(0.15),
            height: getScreenHeight(kLayoutHeight * 1 / 8),
            label: isFont
                ? state.rcImageOne.isNotEmpty
                    ? 'PICKED'
                    : label
                : state.rcImageTwo.isNotEmpty
                    ? 'PICKED'
                    : label,
            iColor: isFont
                ? state.rcImageOne.isNotEmpty
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.onPrimaryContainer
                : state.rcImageTwo.isNotEmpty
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.onPrimaryContainer,
            onTap: () async => isFont
                ? await cubit.pickImage(context)
                : await cubit.pickBackImage(context)),
      );
    });
  }
}

class RcNumberInput extends StatelessWidget {
  const RcNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RcCubit, RcState>(
      builder: (context, state) {
        var cubit = context.read<RcCubit>();
        return TowFieldColumn(
          title: 'Vehicle Number',
          hint: 'Vehicle Number',
          onChange: cubit.changeVehicleNo,
          exm: InkWell(
            onTap: () {
              showSheet(
                context: context,
                widget: (context) => Container(
                  margin: edgeInsetsT20.add(edgeInsetsT20),
                  padding: edgeInsets1505,
                  child: Column(
                    children: [
                      Text(
                        """Part 1: Two-letter State Codes; two alphabets which indicates the State or Union Territory to which the vehicle is registered.
Part 2: District Number; a two-digit number allocated to a district within the respective state or Union Territory. Due to heavy volume of vehicle registration, unique numbers may be allocated to multiple RTO offices within a single district.
Part 3: Single or multiple alphabets; consists of one, two or three alphabets or may not exist at all. This shows the ongoing series of an RTO (also acts as a counter of the number of vehicles registered) and/or vehicle classification. Alphabets 'O' and 'I' are not used here to avoid confusion with digits 0 or 1.
Part 4: Unique number between 1 and 9999; it's issued sequentially and is unique to each registration.""",
                        style: inter(),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Note: All in capital *",
                        style:
                            inter(color: Theme.of(context).colorScheme.error),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('e.g: WB01DQ8888'),
                SizedBox(width: 8),
                Icon(
                  Icons.info_outline,
                  size: 15,
                ),
              ],
            ),
          ),
          capitalization: TextCapitalization.characters,
          errorText: state.vehicleNumber.displayError != null
              ? 'Enter valid Vehicle number'
              : null,
        );
      },
    );
  }
}
