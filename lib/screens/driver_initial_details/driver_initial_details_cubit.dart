import 'package:formz/formz.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../domain/store/store.dart';
import '../../../../domain/repository/repository.dart';
import '../../../../utility/utility/utility.dart';
import '../../../../package/package/package.dart';
import '../../routes/route_path.dart';
import 'export.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

class DriverInitialDetailsCubit
    extends HydratedCubit<DriverInitialDetailsState> {
  DriverInitialDetailsCubit(this.driverStore, this.driverDetailsRepository,
      this.vehicleStore, this.notifier)
      : super(const DriverInitialDetailsState());

  final Notifier notifier;
  final DriverStore driverStore;
  final DriverDetailsRepository driverDetailsRepository;

  final DriverVehicleStore vehicleStore;

  @override
  DriverInitialDetailsState? fromJson(Map<String, dynamic> json) =>
      DriverInitialDetailsState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(DriverInitialDetailsState state) =>
      state.toMap();

  Future<void> showPopUp(BuildContext context) async {
    await popUp(context, [logoutMenu]);
  }

  Future<void> done(BuildContext context) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    Map<String, String> data = {
      'id': getIt<DriverVehicleStore>().state.id,
      'status': '1'
    };
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await driverDetailsRepository.submitAllDetails(data).then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(status: FormzSubmissionStatus.failure));
              notifier.errorMessage(context: context, message: l.message);
            },
            (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              var info = vehicleStore.state.copyWith(status: '1');
              vehicleStore.setDriverVehicle(info);
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              context.go(Screen.waitForVerification.path);
            },
          ),
        );
  }
}
