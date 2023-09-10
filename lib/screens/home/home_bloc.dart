import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../package/package/package.dart';
import 'export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Notifier notifier;
  HomeBloc(this.notifier) : super(const HomeState()) {
    on<ChangeOnlineStatus>(_onChangeOnlineStatus);
    on<ChangeNavBar>(_onChangeNavBar);
  }

  FutureOr<void> _onChangeOnlineStatus(
      ChangeOnlineStatus event, Emitter<HomeState> emit) {
    emit(state.copyWith(onlineStatus: event.value));
  }

  FutureOr<void> _onChangeNavBar(ChangeNavBar event, Emitter<HomeState> emit) {
    emit(state.copyWith(navbarIndex: event.index));
  }
}
