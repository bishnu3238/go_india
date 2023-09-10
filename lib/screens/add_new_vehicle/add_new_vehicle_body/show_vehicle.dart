import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/common/screen_utils.dart';
import 'package:go_india/package/custom_button/custom_button.dart';
import 'package:go_india/screens/add_new_vehicle/export.dart';
import 'package:go_india/utility/constant/constant.dart';
import 'package:go_router/go_router.dart';

class ShowVehicle extends StatelessWidget {
  final AddNewVehicleCubit cubit;

  const ShowVehicle({required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewVehicleCubit, AddNewVehicleState>(
      bloc: cubit,
      builder: (ctx, state) {
        return SizedBox(
          height: getScreenHeight(kLayoutHeight * 1 / 2),
          width: double.maxFinite,
          child: Stack(
            children: [
              Container(
                margin: edgeInsetsT20.add(edgeInsetsT20),
                padding: edgeInsets10,
                height: getScreenHeight(kLayoutHeight * 1 / 2.5),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.vehicleStore.state.length,
                  itemBuilder: (ctx, index) {
                    var vehicle = cubit.vehicleStore.state[index];

                    return Card(
                      elevation: 2,



                      shadowColor: kGolden,
                      child: RadioListTile(
                        value: vehicle.id,

                        controlAffinity: ListTileControlAffinity.trailing,
                        groupValue: state.vehicleTypeId,
                        onChanged:(value) {
                          cubit.chooseVehicle(value);
                          context.pop();
                        },
                        title: Text(
                          vehicle.vehicleType,
                          style: gQuan(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: edgeInsets10,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: ElButton(
                    text: 'Done',
                    onTap: () => context.pop(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
