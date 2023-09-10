import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/domain/entity/entity.dart';
import 'package:go_india/domain/repository/repository.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/store/store.dart';
import '../../../../utility/utility/utility.dart';
import '../../driver_initial_details_cubit.dart';
import 'aadhar_card_state.dart';
import 'export.dart';

class AadhaarCardCubit extends Cubit<AadhaarCardState> {
  AadhaarCardCubit(this.notifier, this.driverStore, this.vehicle,
      this.driverDetailsRepository)
      : super(AadhaarCardState());

  final Notifier notifier;

  final DriverStore driverStore;
  final DriverVehicleStore vehicle;
  final DriverDetailsRepository driverDetailsRepository;

  Future<void> pickImage(BuildContext context) async {
    if (!context.mounted) return;
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) => emit(state.copyWith(
          aadhaarImageOne: r,
          isValid: (Formz.validate([state.aadhaarNumber]) &&
              state.aadhaarImageOne.isNotEmpty &&
              state.aadhaarImageTwo.isNotEmpty),
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
          aadhaarImageTwo: r,
          isValid: (Formz.validate([state.aadhaarNumber]) &&
              state.aadhaarImageOne.isNotEmpty &&
              state.aadhaarImageTwo.isNotEmpty),
        )),
      ),
    );
  }

  Future<void> done(BuildContext context) async {
    AadhaarInfo aadhaarInfo = AadhaarInfo(
        aadhaarNo: state.aadhaarNumber.value,
        aadhaarImage: state.aadhaarImageOne[0]!.path,
        aadhaarImageBack: state.aadhaarImageTwo[0]!.path,
        status: 1);
    var driverDetails =
        driverStore.state.driverDetails.copyWith(aadhaarInfo: aadhaarInfo);
    var details = driverStore.state.copyWith(driverDetails: driverDetails);
    driverStore.setDriver(details);

    var data = aadhaarInfo.toMap();
    data.putIfAbsent('driver_id', () => driverStore.state.id);

    Map<String, dynamic> images = {
      'aadhar_photo': state.aadhaarImageOne[0]!.path,
      'aadhar_photo_back': state.aadhaarImageTwo[0]!.path,
    };

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await driverDetailsRepository.submitAadhaarDetails(data, images).then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(status: FormzSubmissionStatus.failure));
              notifier.errorMessage(context: context, message: l.message);
            },
            (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              var cubit = context.read<DriverInitialDetailsCubit>();
              cubit.emit(cubit.state.copyWith(
                isAadhaarDone: state.status.isSuccess,
              ));

              context.pop();
            },
          ),
        );
  }

  changeAadhaar(String value) {
    AadhaarNumber aadhaarNumber = AadhaarNumber.dirty(value);

    emit(state.copyWith(
      aadhaarNumber: aadhaarNumber,
      isValid: (Formz.validate([aadhaarNumber]) &&
          state.aadhaarImageOne.isNotEmpty &&
          state.aadhaarImageTwo.isNotEmpty),
    ));
  }
}
