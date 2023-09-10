import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/screens/profile_settings/export.dart';

import '../../domain/store/store.dart';

class ProfileSettingsCubit extends Cubit<ProfileSettingsState>{
  ProfileSettingsCubit(this.driverStore): super(ProfileSettingsState());

  final DriverStore driverStore;




}