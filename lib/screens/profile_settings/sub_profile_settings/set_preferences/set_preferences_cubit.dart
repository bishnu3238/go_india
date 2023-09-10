import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';


import 'export.dart';
class SetPreferencesCubit extends HydratedCubit<SetPreferencesState>{
  SetPreferencesCubit(): super(SetPreferencesState());

  @override
  SetPreferencesState? fromJson(Map<String, dynamic> json) => SetPreferencesState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(SetPreferencesState state) =>state.toMap();

  void onEmailNotification(bool value) {
    emit(state.copyWith(isEmailOn: value));
  }
  void onSMSNotification(bool value) {
    emit(state.copyWith(isSMSPhoneOn: value));
  }
  void onNotification(bool value) {
    emit(state.copyWith(isNotificationOn: value));
  }
}