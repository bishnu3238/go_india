import 'package:bloc/bloc.dart';
import 'package:go_india/domain/store/store.dart';

import '../../../../utility/utility/utility.dart';
import 'export.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.driverStore)
      : super(UserProfileState(driver: driverStore.state));

  final DriverStore driverStore;

  void changeGender(Gender? value) => emit(state.copyWith(gender: value));
}
