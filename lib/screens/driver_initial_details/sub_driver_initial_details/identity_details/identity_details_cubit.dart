import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import '../../../../domain/repository/repository.dart';
import '../../../../package/package/package.dart';
import '../../../../domain/store/store.dart';
import '../../export.dart';

class IdentityDetailsCubit extends Cubit<IdentityDetailsState> {
  IdentityDetailsCubit(this.notifier, this.driverStore, this.driverDetailsStore,
      this.driverDetailsRepository)
      : super(IdentityDetailsState.init(driverDetailsStore.state.vehicleInfo));

  final Notifier notifier;
  final DriverStore driverStore;
  final DriverVehicleStore driverDetailsStore;
  final DriverDetailsRepository driverDetailsRepository;

  void changeYesNoOne(YesNo? value) =>
      emit(state.copyWith(isVehicleOwner: value));

  void changeYesNoTwo(YesNo? value) =>
      emit(state.copyWith(isVehicleOlderThenYear: value));

  void changeIdDoc(IdDoc? value) =>
      emit(state.copyWith(currentLocalAddressIn: value));

  Future done(BuildContext context) async {
    var details = driverDetailsStore.state.copyWith(
      vehicleInfo: driverDetailsStore.state.vehicleInfo.copyWith(
        currentLocalAddress: state.currentLocalAddressIn.toName,
        isVehicleOwner: state.isVehicleOwner.asBool,
        isVehicleOlderThenYear: state.isVehicleOlderThenYear.asBool,
      ),
    );
    driverDetailsStore.setDriverVehicle(details);

    Map<String, String> data = {
      'vehicle_id': driverDetailsStore.state.id,
      'is_vehicle_owner': state.isVehicleOwner.name,
      'is_vehicle_older_than_year': state.isVehicleOlderThenYear.name,
      'current_local_address': state.currentLocalAddressIn.toName
    };

    await driverDetailsRepository
        .submitIdentityDetails(data)
        .then((value) => value.fold(
              (l) {
                emit(state.copyWith(status: FormzSubmissionStatus.failure));
                notifier.errorMessage(context: context, message: l.message);
              },
              (r) {
                emit(state.copyWith(status: FormzSubmissionStatus.success));
                var cubit = context.read<DriverInitialDetailsCubit>();
                cubit.emit(cubit.state.copyWith(
                  isIdentityDetailsDone: state.status.isSuccess,
                ));

                context.pop();
              },
            ));
  }
}
