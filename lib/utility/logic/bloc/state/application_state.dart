import 'package:equatable/equatable.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../../../../domain/entity/entity.dart';

final class ApplicationState extends Equatable {
  final AuthStatus status;
  final Screen screen;

  const ApplicationState._({
    required this.status,
    required this.screen,
  });

  factory ApplicationState.init(AuthRepository authRepository) =>
      authRepository.currentDriver.authStatus == AuthStatus.unauthenticated
          ? const ApplicationState.unauthenticated()
          : ApplicationState.authenticated(authRepository.currentDriver);

  const ApplicationState.authenticated(Driver driver)
      : this._(
          status: AuthStatus.authenticated,
          screen: Screen.splash,
        );

  const ApplicationState.unauthenticated()
      : this._(
          status: AuthStatus.unauthenticated,
          screen: Screen.splash,
        );

  Map<String, dynamic> toMap() => {
        'status': status,
        'screen': screen,
      };

  factory ApplicationState.fromJson(json) => ApplicationState._(
        status: json['status'],
        screen: json['screen'],
      );

  ApplicationState copyWith({
    AuthStatus? status,
    Screen? screen,
  }) =>
      ApplicationState._(
        status: status ?? this.status,
        screen: screen ?? this.screen,
      );

  @override
  List<Object> get props => [status, screen];
}
