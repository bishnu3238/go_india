import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
 import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repository/repository.dart';
import '../../../../package/package/package.dart';
import '../../../../utility/utility/utility.dart';
import '../../../../domain/store/store.dart';
import '../../export.dart';

class PollutionCubit extends Cubit<PollutionState> {
  PollutionCubit(this.notifier, this.driverStore, this.driverDetailsStore,
      this.driverDetailsRepository)
      : super(PollutionState());

  final Notifier notifier;
  final DriverStore driverStore;
  final DriverVehicleStore driverDetailsStore;
  final DriverDetailsRepository driverDetailsRepository;

  Future<void> selectPollutionImage(BuildContext context) async {
    if (!context.mounted) return;
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) => emit(state.copyWith(
          pollutionImage: r,
          isValid: r.isNotEmpty,
        )),
      ),
    );
  }

  Future done(BuildContext context) async {

    var info = driverDetailsStore.state.vehicleInfo
        .copyWith(pollutionImage: state.pollutionImage[0]!.path);

    var details = driverDetailsStore.state.copyWith(vehicleInfo: info);
    driverDetailsStore.setDriverVehicle(details);

    Map<String, String> data = {'vehicle_id': driverDetailsStore.state.id};

    Map<String, dynamic> images = {
      'pollution_certificate_photo': state.pollutionImage[0]!.path
    };
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    await driverDetailsRepository
        .submitPollutionCertificateDetails(data, images)
        .then((value) => value.fold(
              (l) {
                emit(state.copyWith(status: FormzSubmissionStatus.failure));
                notifier.errorMessage(context: context, message: l.message);
              },
              (r) {
                emit(state.copyWith(status: FormzSubmissionStatus.success));
                var cubit = context.read<DriverInitialDetailsCubit>();
                cubit.emit(cubit.state.copyWith(
                  isPollutionDone: state.status.isSuccess,
                ));

                context.pop();
              },
            ));
  }
}
