import 'package:bloc/bloc.dart';

import '../../domain/store/store.dart';
import 'export.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  final DriverStore driverStore;

  WelcomeCubit(this.driverStore) : super(const WelcomeState());
}
