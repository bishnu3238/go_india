
import '../../../utility/utility.dart';

abstract class InternetConnectivityState{

}
class InternetLoadingState extends InternetConnectivityState{

}
class InternetConnectionState extends InternetConnectivityState{
  ConnectionType connectionType;
  InternetConnectionState({required this.connectionType});
}

class InternetDisconnectionState extends InternetConnectivityState{

}

