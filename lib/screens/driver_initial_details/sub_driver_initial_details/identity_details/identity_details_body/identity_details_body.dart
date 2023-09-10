import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:go_india/package/package/package.dart';

class IdentityDetailsBody extends StatelessWidget {
  const IdentityDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<IdentityDetailsCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: BlocBuilder<IdentityDetailsCubit, IdentityDetailsState>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 20),
                CardHeadingListTile(
                  tileAlign: ListTileTitleAlignment.top,
                  leading: Text('1.', style: gQuan()),
                  title: Text(identityOne, style: gideonRoman(size: 14)),
                  subtitle: RadioButtons<YesNo>(
                    enums: YesNo.values,
                    groupValue: state.isVehicleOwner,
                    onChange: cubit.changeYesNoOne,
                  ),
                ),
                CardHeadingListTile(
                  tileAlign: ListTileTitleAlignment.top,
                  leading: Text('2.', style: gQuan()),
                  title: Text(identityTwo, style: gideonRoman(size: 14)),
                  subtitle: RadioButtons<YesNo>(
                    enums: YesNo.values,
                    groupValue: state.isVehicleOlderThenYear,
                    onChange: cubit.changeYesNoTwo,
                  ),
                ),
                CardHeadingListTile(
                  tileAlign: ListTileTitleAlignment.top,
                  leading: Text('3.', style: gQuan()),
                  title: Text(identityThree, style: gideonRoman(size: 14)),
                  subtitle: RadioButtons<IdDoc>(
                    enums: IdDoc.values,
                    groupValue: state.currentLocalAddressIn,
                    onChange: cubit.changeIdDoc,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

const identityOne =
    'Is your name mentioned in the Registration Certificate as the vehicle owner?';
const identityTwo =
    'Is the vehicle older than one year(from the date of registration)?';
const identityThree =
    'Is your current local address mentioned in the Driving License or in the Aadhar Document?';
