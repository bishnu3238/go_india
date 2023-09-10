import 'package:formz/formz.dart';
import 'package:go_india/domain/store/driver_store.dart';

import '../../domain/entity/entity.dart';

class WaitForVerificationState {
  final Driver driver;

  WaitForVerificationState(
      {this.driver = Driver.empty,
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage = ''});
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  WaitForVerificationState copyWith({
    Driver? driver,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      WaitForVerificationState(
          driver: driver ?? this.driver,
          status: status ?? this.status,
          isValid: isValid ?? this.isValid,
          errorMessage: errorMessage ?? this.errorMessage);

    WaitForVerificationState init(DriverStore driverStore) => copyWith(driver: driverStore.state);
}
