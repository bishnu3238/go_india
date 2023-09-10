import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_india/domain/repository/repository.dart';

import '../../../../domain/store/store.dart';
import '../../../../package/package/package.dart';
import '../../../../utility/utility/utility.dart';
import 'export.dart';

class EditUserProfileCubit extends Cubit<EditUserProfileState> {
  EditUserProfileCubit(this.driverStore, this.notifier, this.driverRepository)
      : super(EditUserProfileState(driver: driverStore.state));

  final Notifier notifier;
  final DriverStore driverStore;
  final DriverRepository driverRepository;

  Future pickProfileImage(BuildContext context) async {
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) {
          var driver = state.driver.copyWith(image: r[0]!.path);
          getIt<DriverStore>().setDriver(driver);
          emit(state.copyWith(
            driver: driver,
            isValid: state.driver != getIt<DriverStore>().state,
          ));
        },
      ),
    );
  }

  void changeName(String value) => emit(state.copyWith(
        driver: state.driver.copyWith(name: value),
        isValid: state.driver != getIt<DriverStore>().state,
      ));
  void changeMobile(String value) => emit(state.copyWith(
        driver: state.driver.copyWith(mobile: value),
        isValid: state.driver != getIt<DriverStore>().state,
      ));
  void changeEmail(String value) => emit(state.copyWith(
        driver: state.driver.copyWith(email: value),
        isValid: state.driver != getIt<DriverStore>().state,
      ));
  void changeGender(Gender? value) => emit(state.copyWith(
        driver: state.driver.copyWith(gender: value),
        isValid: state.driver != getIt<DriverStore>().state,
      ));

  Future<void> update(BuildContext context) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    Map<String, String> data = {

    };
    await driverRepository.updateDriver(data).then((value) => value.fold(
          (l) {
            emit(state.copyWith(
                errorMessage: l.message,
                status: FormzSubmissionStatus.failure));
            notifier.errorMessage(context: context, message: l.message);
          },
          (driver) {
            driverStore.setDriver(driver);
            emit(state.copyWith(status: FormzSubmissionStatus.success));
          },
        ));
  }
}
