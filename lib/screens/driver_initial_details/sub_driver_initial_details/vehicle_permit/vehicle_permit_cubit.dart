 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
 import 'package:go_router/go_router.dart';

import '../../../../domain/repository/repository.dart';
import '../../../../domain/store/store.dart';
import '../../../../package/package/package.dart';
import '../../../../utility/utility/utility.dart';
import '../../export.dart';

class VehiclePermitCubit extends Cubit<VehiclePermitState> {
  VehiclePermitCubit(this.notifier, this.driverStore, this.driverDetailsStore,
      this.driverDetailsRepository)
      : super(VehiclePermitState());

  final Notifier notifier;

  final DriverStore driverStore;
  final DriverVehicleStore driverDetailsStore;
  final DriverDetailsRepository driverDetailsRepository;

  changeIsVehicleIssued(YesNo? value) =>
      emit(state.copyWith(isPermitIssued: value));

  Future pickPermitImage(BuildContext context) async {
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) => emit(state.copyWith(
          vehiclePermitImage: r,
          form7Image: [],
          isValid: r.isNotEmpty,
        )),
      ),
    );
  }

  Future pickForm7Image(BuildContext context) async {
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) => emit(state.copyWith(
          form7Image: r,
          vehiclePermitImage: [],
          isValid: r.isNotEmpty && state.vehiclePermitImage.isEmpty,
        )),
      ),
    );
  }

  Future done(BuildContext context) async {
    var data = {
      'vehicle_id': driverDetailsStore.state.id,
      'has_vehicle_permit': state.isPermitIssued.name,
    };

    Map<String, dynamic> images = {
      'vehicle_permit': state.vehiclePermitImage.isNotEmpty
          ? state.vehiclePermitImage[0]!.path
          : null,
      'form7': state.form7Image.isNotEmpty ? state.form7Image[0]!.path : null,
    };

    images.removeWhere((key, value) => value == null);

    images.log();
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await driverDetailsRepository.submitVehiclePermitDetails(data, images).then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(status: FormzSubmissionStatus.failure));
              notifier.errorMessage(context: context, message: l.message);
            },
            (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              var cubit = context.read<DriverInitialDetailsCubit>();
              cubit.emit(
                cubit.state.copyWith(
                  isVehiclePermitDone: state.status.isSuccess,
                ),
              );

              context.pop();
            },
          ),
        );
  }
}
