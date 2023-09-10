
import '../../../../domain/entity/entity.dart';

sealed class ApplicationEvent {
  const ApplicationEvent();
}

final class AppLogoutEvent extends ApplicationEvent {
  const AppLogoutEvent();
}

final class AppUserChanged extends ApplicationEvent {
  const AppUserChanged(this.driver);

  final Driver driver;
}


final class AppOnResume extends ApplicationEvent{

  const AppOnResume(this.lastPage);
  final String lastPage;
}

final class AppOnClose extends ApplicationEvent{

  const AppOnClose();
}

final class AppOnBackground extends ApplicationEvent{

  const AppOnBackground();
}
