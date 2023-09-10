import 'package:auto_size_text/auto_size_text.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:go_india/utility/constant/padding_margin.dart';
import 'package:go_india/utility/constant/text_style.dart';

import '../../../package/package/package.dart';
import '../export.dart';

class AddNewVehicleBody extends StatelessWidget {
  const AddNewVehicleBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<AddNewVehicleCubit, AddNewVehicleState>(
        builder: (context, state) {
      var cubit = context.watch<AddNewVehicleCubit>();
      return ClearFocus(
        child: SingleChildScrollView(
          child: Padding(
            padding: edgeInsets1020,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Add your vehicle details',
                  style: gideonRoman(
                      weight: fwb, size: getScreenWidth(kLayoutWidth * 1 / 20)),
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Please enter the required details.',
                  style: gideonRoman(
                      weight: fw2, size: getScreenWidth(kLayoutWidth * 1 / 30)),
                ),
                const SizedBox(height: 20),
                TowFieldColumn(
                  title: 'Select Category',
                  borderColor: theme.colorScheme.outlineVariant,
                  hint: state.vehicleTypeId.isEmpty
                      ? 'Select Category'
                      : cubit.vehicleName(state.vehicleTypeId).vehicleType,
                  hintStyle: state.vehicleTypeId.isNotEmpty
                      ? gideonRoman(weight: fw7, size: 15)
                      : null,
                  readOnly: true,
                  onTap: () => cubit.showVehicleTypes(context, cubit),
                  suffix: const Icon(FontAwesomeIcons.angleDown),
                ),
                const SizedBox(height: 25),
                AutoSizeText(
                    'Enter Vehicle Number mentioned in your Registration Certificate (RC).',
                    style: gideonRoman(
                        weight: fw5,
                        size: getScreenWidth(kLayoutWidth * 1 / 25))),
                const SizedBox(height: 15),
                TowFieldColumn(
                  title: 'Vehicle Number',
                  hint: 'Vehicle Number',
                  borderColor: theme.colorScheme.outlineVariant,
                  onChange: cubit.vehicleNoChange,
                  capitalization: TextCapitalization.characters,
                  errorText: state.vehicleNo.displayError != null
                      ? "Enter valid vehicle Number"
                      : null,
                  example: 'e.g: WB00AZ1234',
                ),
                const SizedBox(height: 15),
                TowFieldColumn(
                  title: 'Re-enter Vehicle Number',
                  hint: 'Re-enter Vehicle Number',
                  borderColor: theme.colorScheme.outlineVariant,
                  capitalization: TextCapitalization.characters,
                  onChange: cubit.reCheckVehicleNoChange,
                  errorText: state.reVehicleNo.value != state.vehicleNo.value
                      ? "vehicle Number not match"
                      : null,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
