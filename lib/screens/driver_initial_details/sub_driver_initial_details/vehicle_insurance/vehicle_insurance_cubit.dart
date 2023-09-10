
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/repository/repository.dart';
import '../../../../domain/store/store.dart';
import '../../../../package/package/package.dart';
import '../../../../utility/utility/utility.dart';
import '../../export.dart';

class VehicleInsuranceCubit extends Cubit<VehicleInsuranceState> {
  VehicleInsuranceCubit(this.notifier, this.driverStore,
      this.driverDetailsStore, this.driverDetailsRepository)
      : super(VehicleInsuranceState());

  final Notifier notifier;
  final DriverStore driverStore;
  final DriverVehicleStore driverDetailsStore;
  final DriverDetailsRepository driverDetailsRepository;

  Future pickInsuranceImage(BuildContext context) async {
    if (!context.mounted) return;
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) => emit(state.copyWith(
          insuranceImage: r,
          isValid: r.isNotEmpty,
        )),
      ),
    );
  }

  Future done(BuildContext context) async {
    Map<String, String> data = {'vehicle_id': driverDetailsStore.state.id};

    Map<String, dynamic> images = {
      'insurance_photo': state.insuranceImage[0]!.path
    };
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    await driverDetailsRepository
        .submitVehicleInsuranceDetails(data, images)
        .then((value) => value.fold(
              (l) {
                emit(state.copyWith(status: FormzSubmissionStatus.failure));
                notifier.errorMessage(context: context, message: l.message);
              },
              (r) {
                emit(state.copyWith(status: FormzSubmissionStatus.success));
                var cubit = context.read<DriverInitialDetailsCubit>();
                cubit.emit(cubit.state.copyWith(
                  isVehicleInsuranceDone: state.status.isSuccess,
                ));

                context.pop();
              },
            ));
  }
}
