import 'package:bloc/bloc.dart';
import '../../package/package/package.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    'onChange -- $bloc $change'.log();
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    'onClose -- $bloc'.log();
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    'onCreate -- $bloc'.log();
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    'onError -- $bloc Error: $error StackTrace: $stackTrace'.log();
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    'onEvent -- $bloc $event'.log();
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    'onTransition -- $bloc, $transition'.log();

  }
}
