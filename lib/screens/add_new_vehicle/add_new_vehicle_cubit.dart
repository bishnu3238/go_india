import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/domain/entity/driver/sub_class/vehicle_info.dart';
import 'package:go_india/domain/repository/repository.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entity/entity.dart';
import '../../domain/store/store.dart';
import 'export.dart';

class AddNewVehicleCubit extends Cubit<AddNewVehicleState> {
  AddNewVehicleCubit(this.driverDetailsRepository, this.vehicleStore,
      this.vehicle, this.notifier, this.driverStore)
      : super(const AddNewVehicleState());
  final VehicleTypeStore vehicleStore;
  final DriverStore driverStore;
  final DriverVehicleStore vehicle;
  final Notifier notifier;
  final DriverDetailsRepository driverDetailsRepository;

  Future init() async {
    await driverDetailsRepository.getVehicleTypes();
  }

  void vehicleNoChange(String value) {
    VehicleNumber vehicleNo = VehicleNumber.dirty(value);

    emit(state.copyWith(
        vehicleNo: vehicleNo,
        isValid: (state.vehicleTypeId.isNotEmpty &&
                Formz.validate([state.reVehicleNo, vehicleNo]))
            ? true
            : false));
  }

  void reCheckVehicleNoChange(String value) {
    VehicleNumber reVehicleNo = VehicleNumber.dirty(value);
    ' ${reVehicleNo == state.vehicleNo}  hello'.log();
    emit(
      state.copyWith(
          reVehicleNo: reVehicleNo,
          isValid: (state.vehicleTypeId.isNotEmpty &&
                  state.vehicleNo.value == reVehicleNo.value
              // Formz.validate([state.vehicleNo, reVehicleNo])
              )
              ? true
              : false),
    );
  }

  Future showVehicleTypes(
    BuildContext context,
    AddNewVehicleCubit cubit,
  ) async =>
      await showSheet(
        context: context,
        widget: (context) => ShowVehicle(cubit: cubit),
      );

  void chooseVehicle(String? value) {
    emit(state.copyWith(
        vehicleTypeId: value,
        isValid: Formz.validate([state.reVehicleNo, state.reVehicleNo])));
   }

  VehicleType vehicleName(String id) =>
      vehicleStore.state.firstWhere((element) => element.id == id);

  Future<void> vehicleDetailsSubmit(BuildContext context) async {
    VehicleInfo vehicleInfo = VehicleInfo.empty.copyWith(
      vehicleTypeId: state.vehicleTypeId,
      vehicleNo: state.vehicleNo.value,
    );
    var setData = vehicle.state.copyWith(
      vehicleInfo: vehicleInfo,
      driverId: driverStore.state.id,
    );
    vehicle.setDriverVehicle(setData);
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    Map<String, String> data = {
      'vehicle_type': state.vehicleTypeId,
      'vehicle_number': state.vehicleNo.value,
      'driver_id': driverStore.state.id,
    };
    await driverDetailsRepository
        .submitVehicleDetails(data)
        .then((value) => value.fold(
              (l) {
                emit(state.copyWith(status: FormzSubmissionStatus.failure));
                notifier.errorMessage(context: context, message: l.message);
              },
              (r) {
                emit(state.copyWith(status: FormzSubmissionStatus.success));
                context.go(Screen.driverInitialDetails.path);
              },
            ));
  }
}
