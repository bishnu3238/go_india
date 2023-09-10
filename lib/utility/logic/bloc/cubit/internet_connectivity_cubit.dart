import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import '../../../utility/utility.dart';

class InternetConnectivityCubit extends Cubit<InternetConnectivityState> {
  final Connectivity connectivity;
  late StreamSubscription internetSubscription;

  InternetConnectivityCubit({required this.connectivity})
      : super(InternetLoadingState()) {
    internetConnectionStateCheck();
  }

  StreamSubscription<ConnectivityResult> internetConnectionStateCheck() {
    connectivity.checkConnectivity().then((value) =>
    value == ConnectivityResult.none
        ? emit(InternetDisconnectionState())
        : emit(InternetLoadingState()));
    return internetSubscription = connectivity.onConnectivityChanged.listen(
          (event) {
        log('internet_connectivity_state:  ${event.name}');
        if (event == ConnectivityResult.wifi) {
          emit(InternetConnectionState(connectionType: ConnectionType.wifi));
        } else if (event == ConnectivityResult.mobile) {
          emit(InternetConnectionState(connectionType: ConnectionType.mobile));
        } else if (event == ConnectivityResult.none) {
          emit(InternetDisconnectionState());
        } else {
          emit(InternetDisconnectionState());
        }
      },
    );
  }

  @override
  Future<void> close() {
    internetSubscription.cancel();
    return super.close();
  }
}
