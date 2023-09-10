import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/repository/repository.dart';
import '../../../../domain/store/store.dart';
import '../../../../package/package/package.dart';
import '../../../../utility/utility/utility.dart';
import '../../export.dart';

class VehicleAuditCubit extends Cubit<VehicleAuditState> {
  VehicleAuditCubit(this.notifier, this.driverStore, this.driverDetailsStore,
      this.driverDetailsRepository)
      : super(VehicleAuditState());

  final Notifier notifier;

  final DriverStore driverStore;
  final DriverVehicleStore driverDetailsStore;
  final DriverDetailsRepository driverDetailsRepository;

  Future<void> pickImage(BuildContext context) async {
    if (!context.mounted) return;
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) => emit(state.copyWith(
          vehicleImageOne: r,
          isValid: (r.isNotEmpty && state.vehicleImageTwo.isNotEmpty),
        )),
      ),
    );
  }

  Future<void> pickBackImage(BuildContext context) async {
    if (!context.mounted) return;
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) => emit(state.copyWith(
          vehicleImageTwo: r,
          isValid: (state.vehicleImageOne.isNotEmpty && r.isNotEmpty),
        )),
      ),
    );
  }

  Future<void> done(BuildContext context) async {
    var data = {
      'vehicle_id': driverDetailsStore.state.id,
    };

    Map<String, dynamic> images = {
      'vehicle_front_photo': state.vehicleImageOne[0]!.path,
      'vehicle_back_photo': state.vehicleImageTwo[0]!.path,
    };

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await driverDetailsRepository.submitVehicleAuditDetails(data, images).then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(status: FormzSubmissionStatus.failure));
              notifier.errorMessage(context: context, message: l.message);
            },
            (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              var cubit = context.read<DriverInitialDetailsCubit>();
              cubit.emit(cubit.state.copyWith(
                isVehicleAuditDone: state.status.isSuccess,
              ));

              context.pop();
            },
          ),
        );
  }
}
