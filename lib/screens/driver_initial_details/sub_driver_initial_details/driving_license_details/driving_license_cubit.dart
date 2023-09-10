import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:go_india/domain/store/driver_vehicle_store.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/domain/repository/repository.dart';
import 'package:go_india/domain/store/driver_store.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:go_india/domain/entity/entity.dart';
import '../../../../utility/utility/utility.dart';
import '../../export.dart';

class DrivingLicenseCubit extends Cubit<DrivingLicenseState> {
  DrivingLicenseCubit(this.notifier, this.driverDetailsStore,
      this.driverDetailsRepository, this.driverStore)
      : super(const DrivingLicenseState());

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
          dlImage: r,
          isValid: (Formz.validate([state.dlNumber]) &&
              r.isNotEmpty &&
              state.dlBackImage.isNotEmpty &&
              state.dob.isValid),
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
          dlBackImage: r,
          isValid: (Formz.validate([state.dlNumber]) &&
              state.dlImage.isNotEmpty &&
              r.isNotEmpty &&
              state.dob.isValid),
        )),
      ),
    );
  }

  void changeDlNo(String value) {
    DLNumber dlNumber = DLNumber.dirty(value);
    emit(state.copyWith(
      dlNumber: dlNumber,
      isValid: (Formz.validate([dlNumber]) &&
          state.dlImage.isNotEmpty &&
          state.dlBackImage.isNotEmpty &&
          state.dob.isValid),
    ));
  }

  Future pickDOB(BuildContext context) async {
    await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1920),
      initialDate: DateTime.now(),
    ).then((value) {
      DateOfBirth dateOfBirth = DateOfBirth.dirty(value);

      emit(state.copyWith(
        dob: dateOfBirth,
        isValid: (Formz.validate([state.dlNumber]) &&
            state.dlImage.isNotEmpty &&
            state.dlBackImage.isNotEmpty &&
            dateOfBirth.isValid),
      ));
    });
  }

  Future done(BuildContext context) async {
    DrivingLicenseInfo drivingLicenseInfo = DrivingLicenseInfo(
        drivingLicenseNo: state.dlNumber.value,
        drivingLicenseImage: state.dlImage[0]!.path,
        drivingLicenseImageBack: state.dlBackImage[0]!.path,
        dateOfBirth: state.dob.value);

    var driverDetails = driverStore.state.driverDetails
        .copyWith(drivingLicenseInfo: drivingLicenseInfo);
    var details = driverStore.state.copyWith(driverDetails: driverDetails);

    driverStore.setDriver(details);

    Map<String, String> data = {
      'driver_license_number': state.dlNumber.value,
      'driver_id': driverStore.state.id,
      'dob': state.dob.value
    };

    Map<String, dynamic> images = {
      'driving_license_photo': state.dlImage[0]!.path,
      'driving_license_photo_back': state.dlBackImage[0]!.path,
    };
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    await driverDetailsRepository
        .submitDrivingLicenseDetails(data, images)
        .then((value) => value.fold(
              (l) {
                emit(state.copyWith(status: FormzSubmissionStatus.failure));
                notifier.errorMessage(context: context, message: l.message);
              },
              (r) {
                emit(state.copyWith(status: FormzSubmissionStatus.success));
                var cubit = context.read<DriverInitialDetailsCubit>();
                cubit.emit(cubit.state.copyWith(
                  isDrivingLicenseDone: state.status.isSuccess,
                ));

                context.pop();
              },
            ));
  }
}
