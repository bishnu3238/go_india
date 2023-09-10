import 'package:cross_file/src/types/interface.dart';
import 'package:formz/formz.dart';
import 'package:go_india/domain/entity/driver/driver.dart';
import 'package:go_india/utility/constant/enumeration.dart';

import '../../../../package/package/package.dart';

class EditUserProfileState {
  EditUserProfileState(
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
          : driver.image.contains('com.example.go_india')
              ? ImgType.file
              : ImgType.local;

  @override
  String toString() =>
      'EditUserProfileState{driver: $driver, gender: $gender, status: $status, isValid: $isValid, errorMessage: $errorMessage}';

  EditUserProfileState copyWith({
    Driver? driver,
    Gender? gender,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
    List<XFile?>? profileImage,
  }) =>
      EditUserProfileState(
          driver: driver ?? this.driver,
          gender: gender ?? this.gender,
          status: status ?? this.status,
          isValid: isValid ?? this.isValid,
          errorMessage: errorMessage ?? this.errorMessage);
}
