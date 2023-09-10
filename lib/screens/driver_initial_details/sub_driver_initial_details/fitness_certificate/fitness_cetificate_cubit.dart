import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/entity.dart';
import '../../../../domain/repository/repository.dart';
import 'package:go_india/utility/utility/utility.dart';
import '../../../../package/package/package.dart';
import '../../../../domain/store/store.dart';
import '../../export.dart';

class FitnessCertificateCubit extends Cubit<FitnessCertificateState> {
  FitnessCertificateCubit(this.notifier, this.driverStore,
      this.driverDetailsStore, this.driverDetailsRepository)
      : super(FitnessCertificateState());

  final Notifier notifier;

  final DriverStore driverStore;
  final DriverVehicleStore driverDetailsStore;
  final DriverDetailsRepository driverDetailsRepository;

  Future pickFitnessImage(BuildContext context) async {
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) => emit(state.copyWith(
          fitnessImage: r,
          isValid: r.isNotEmpty,
        )),
      ),
    );
  }

  Future done(BuildContext context) async {
    FitnessInfo fitnessInfo =
        FitnessInfo(fitnessCertificateImage: state.fitnessImage[0]!.path);
    var details = driverStore.state.copyWith(
        driverDetails: driverStore.state.driverDetails.copyWith(
      fitnessInfo: fitnessInfo,
    ));
    driverStore.setDriver(details);

    var data = {'driver_id': driverStore.state.id};

    Map<String, dynamic> images = {
      'fitness_certificate': state.fitnessImage[0]!.path
    };

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await driverDetailsRepository.submitFitnessDetails(data, images).then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(status: FormzSubmissionStatus.failure));
              notifier.errorMessage(context: context, message: l.message);
            },
            (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              var cubit = context.read<DriverInitialDetailsCubit>();
              cubit.emit(
                cubit.state.copyWith(isFitnessDone: state.status.isSuccess),
              );

              context.pop();
            },
          ),
        );
  }
}
