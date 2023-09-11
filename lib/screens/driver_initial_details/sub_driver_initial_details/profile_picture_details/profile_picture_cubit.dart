import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/domain/repository/repository.dart';
import 'package:go_india/utility/functions/functions.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/store/store.dart';
import '../../../../package/package/package.dart';
import '../../export.dart';

class ProfilePictureCubit extends Cubit<ProfilePictureState> {
  ProfilePictureCubit(
      this.notifier, this.driverStore, this.driverDetailsRepository)
      : super(ProfilePictureState(driver: driverStore.state));

  final Notifier notifier;
  final DriverStore driverStore;
  final DriverDetailsRepository driverDetailsRepository;

  Future takeProfilePhoto(BuildContext context) async {
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) {
          notifier.errorMessage(context: context, message: l.message);
        },
        (r) async {
          emit(state.copyWith(profileImage: r));
          if (!context.mounted) return;
          await done(context);
        },
      ),
    );
  }

  Future<void> done(BuildContext context) async {
    driverStore.setDriver(
      driverStore.state.copyWith(image: state.profileImage[0]!.path),
    );

    var data = {'driver_id': driverStore.state.id};
    var images = {'profile_photo': state.profileImage[0]!.path};
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await driverDetailsRepository.submitProfilePicture(data, images).then(
          (value) => value.fold(
            (l) {
              l.log();

              emit(state.copyWith(status: FormzSubmissionStatus.failure));
              notifier.errorMessage(context: context, message: l.message);
            },
            (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              var cubit = context.read<DriverInitialDetailsCubit>();
              cubit.emit(cubit.state.copyWith(
                isProfileDone: state.status.isSuccess,
              ));

              context.pop();
            },
          ),
        );
  }
}
