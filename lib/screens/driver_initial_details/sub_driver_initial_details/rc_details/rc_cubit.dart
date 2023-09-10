import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
 import 'package:go_india/domain/repository/repository.dart';
 import 'package:go_india/package/notifier/snack_notifier.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/store/store.dart';
import '../../../../utility/utility/utility.dart';
import '../../driver_initial_details_cubit.dart';
import 'export.dart';

class RcCubit extends Cubit<RcState> {
  RcCubit(this.notifier, this.driverStore, this.driverDetailsStore,
      this.driverDetailsRepository)
      : super(RcState());

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
          rcImageOne: r,
          isValid: (Formz.validate([state.vehicleNumber]) &&
              r.isNotEmpty &&
              state.rcImageTwo.isNotEmpty),
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
          rcImageTwo: r,
          isValid: (Formz.validate([state.vehicleNumber]) &&
              state.rcImageOne.isNotEmpty &&
              r.isNotEmpty),
        )),
      ),
    );
  }

  changeVehicleNo(String value) {
    VehicleNumber vehicleNumber = VehicleNumber.dirty(value);

    emit(state.copyWith(
      vehicleNumber: vehicleNumber,
      isValid: (Formz.validate([vehicleNumber]) &&
          state.rcImageOne.isNotEmpty &&
          state.rcImageTwo.isNotEmpty),
    ));
  }

  void onChangeRc(int? value) =>
      emit(state.copyWith(rcType: RcType.values[value!]));

  Future<void> done(BuildContext context) async {
    Map<String, String> data = {'vehicle_id': driverDetailsStore.state.id};

    Map<String, dynamic> images = {
      'registration_certificate_photo': state.rcImageOne[0]!.path,
      'registration_certificate_photo_back': state.rcImageTwo[0]!.path,
    };

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await driverDetailsRepository.submitRcCertificateDetails(data, images).then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(status: FormzSubmissionStatus.failure));
              notifier.errorMessage(context: context, message: l.message);
            },
            (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              var cubit = context.read<DriverInitialDetailsCubit>();
              cubit.emit(cubit.state.copyWith(
                isRcDone: state.status.isSuccess,
              ));

              context.pop();
            },
          ),
        );
  }
}
