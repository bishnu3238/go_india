import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_india/domain/store/store.dart';
import 'package:go_india/package/notifier/snack_notifier.dart';

import '../../domain/repository/repository.dart';
import 'export.dart';

class WaitForVerificationCubit extends Cubit<WaitForVerificationState> {
  WaitForVerificationCubit(
      this.driverStore, this.notifier, this.detailsRepository, this.repository)
      : super(WaitForVerificationState().init(driverStore));

  final DriverStore driverStore;
  final Notifier notifier;

  final DriverDetailsRepository detailsRepository;
  final DriverRepository repository;

  Future<void> check(BuildContext context) async {
    await repository.getDriver(driverStore.state.id).then((value) => value.fold(
          (l) => notifier.errorMessage(context: context, message: l.message),
          (r) => notifier.successMessage(
              context: context,
              message: 'Driver details Is Verified ${r.status}'),
        ));
    await detailsRepository.getVehicleDetails({
      "driver_id": driverStore.state.id
    }).then((value) => value.fold(
          (l) => notifier.errorMessage(context: context, message: l.message),
          (r) {
            if (context.mounted) {
              notifier.successMessage(
                  context: context,
                  message: 'Vehicle details Is Verified ${r.status}');
              return;
            } else {
              return;
            }
          },
        ));
  }
}
