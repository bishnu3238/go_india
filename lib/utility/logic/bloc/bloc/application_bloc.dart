// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:go_india/utility/constant/constant.dart';
import 'package:go_india/utility/global/global.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../domain/entity/entity.dart';
import '../../../../domain/repository/repository.dart';
import '../../../../domain/store/store.dart';
import '../../../../package/package/package.dart';
import '../../logic/logic.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final AuthRepository _authRepository;
  final DriverRepository _driverRepository;
  final DriverDetailsRepository _driverDetailsRepository;
  late final StreamSubscription<Driver> _userSubscription;

  ApplicationBloc({
    required AuthRepository authRepository,
    required DriverRepository driverRepository,
    required DriverDetailsRepository driverDetailsRepository,
  })  : _authRepository = authRepository,
        _driverRepository = driverRepository,
        _driverDetailsRepository = driverDetailsRepository,
        super(ApplicationState.init(authRepository)) {
    on<AppUserChanged>(_onUserChanged);

    on<AppLogoutEvent>(_onLogoutRequested);

    _userSubscription = _appUserChangeListen;

    if (state.status == AuthStatus.authenticated) {
      var driverId = get<DriverStore>().state.id;
      var data = {'driver_id': driverId};
      _driverRepository.getDriver(driverId);
      _driverDetailsRepository.getVehicleDetails(data);
    }
  }

  void _onUserChanged(AppUserChanged event, Emitter<ApplicationState> emit) {
    emit(
      event.driver.authStatus == AuthStatus.authenticated
          ? ApplicationState.authenticated(event.driver)
          : const ApplicationState.unauthenticated(),
    );
  }

  void _onLogoutRequested(
          AppLogoutEvent event, Emitter<ApplicationState> emit) =>
      _authRepository.logOut();

  StreamSubscription<Driver> get _appUserChangeListen =>
      _authRepository.driver.listen((driver) => add(AppUserChanged(driver)));

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}

enum DriverVehicleDetailsStatus { Complete, Half, Remaining, Uncomplete }
