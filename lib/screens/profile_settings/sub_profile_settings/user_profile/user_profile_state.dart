import 'package:formz/formz.dart';
import 'package:go_india/package/custom_widget/custom_widgets.dart';

import '../../../../domain/entity/entity.dart';
import '../../../../utility/utility/utility.dart';

class UserProfileState {
  UserProfileState(
      {required this.driver,
      this.gender = Gender.unknown,
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage = ''});
  final Driver driver;
  final Gender gender;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  ImgType get imgType => driver.image.contains('http')
      ? ImgType.network
      : driver.image.contains('assets')
          ? ImgType.local
          : ImgType.local;

  UserProfileState copyWith({
    Driver? driver,
    Gender? gender,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      UserProfileState(
          driver: driver ?? this.driver,
          gender: gender ?? this.gender,
          status: status ?? this.status,
          isValid: isValid ?? this.isValid,
          errorMessage: errorMessage ?? this.errorMessage);
}
