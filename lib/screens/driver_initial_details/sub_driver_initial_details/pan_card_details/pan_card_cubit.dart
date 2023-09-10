import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_india/utility/utility/utility.dart';
import '../../../../domain/repository/repository.dart';
import '../../../../package/package/package.dart';
import '../../../../domain/entity/entity.dart';
import '../../../../domain/store/store.dart';
import '../../../common/common.dart' as p;
import '../../export.dart';

class PanCardCubit extends Cubit<PanCardState> {
  PanCardCubit(this.notifier, this.driverStore, this.driverDetailsStore,
      this.driverDetailsRepository)
      : super(PanCardState());

  final Notifier notifier;

  final DriverStore driverStore;
  final DriverVehicleStore driverDetailsStore;
  final DriverDetailsRepository driverDetailsRepository;
  changePanCard(String value) {
    p.PanCard panCard = p.PanCard.dirty(value);

    emit(
      state.copyWith(
          panCard: panCard,
          isValid: (Formz.validate([panCard]) && state.panImage.isNotEmpty)),
    );
  }

  Future pickPanImage(BuildContext context) async {
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) => emit(state.copyWith(
          panImage: r,
          isValid: (Formz.validate([state.panCard]) && r.isNotEmpty),
        )),
      ),
    );
  }

  Future done(BuildContext context) async {
    PanInfo panInfo = PanInfo(
        panNo: state.panCard.value,
        panImage: state.panImage.isEmpty ? '' : state.panImage[0]!.path);

    var details = driverStore.state.copyWith(
        driverDetails:
            driverStore.state.driverDetails.copyWith(panInfo: panInfo));
    driverStore.setDriver(details);

    var data = {
      'driver_id': driverStore.state.id,
      'pan_number': state.panCard.value,
    };

    Map<String, dynamic> images = {'pan_card': state.panImage[0]!.path};

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await driverDetailsRepository.submitPanCardDetails(data, images).then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(status: FormzSubmissionStatus.failure));
              notifier.errorMessage(context: context, message: l.message);
            },
            (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              var cubit = context.read<DriverInitialDetailsCubit>();
              cubit.emit(
                cubit.state.copyWith(isPanDone: state.status.isSuccess),
              );

              context.pop();
            },
          ),
        );
  }
}
