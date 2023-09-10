import 'package:bloc/bloc.dart';
import 'package:go_india/utility/utility/utility.dart';

import 'export.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.init());

  Future initial() async {
    Future.delayed(oneSecond,
        () => emit(state.copyWith(isWaiting: false, isLoading: false)));
  }

  void zoomable() {
    Future.delayed(
        twoSecond, () => emit(state.copyWith(width: 1 / 3, height: 1 / 6)));
  }
}
