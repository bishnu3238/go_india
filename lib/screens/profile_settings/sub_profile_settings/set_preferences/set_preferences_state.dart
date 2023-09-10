import 'package:formz/formz.dart';
import 'package:go_india/package/common/common.dart';

class SetPreferencesState {
  SetPreferencesState(
      {this.isEmailOn = false,
      this.isSMSPhoneOn = false,
      this.isNotificationOn = false,
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage = ''});

  final bool isEmailOn;
  final bool isSMSPhoneOn;
  final bool isNotificationOn;

  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  SetPreferencesState copyWith({
    bool? isEmailOn,
    bool? isSMSPhoneOn,
    bool? isNotificationOn,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      SetPreferencesState(
          isEmailOn: isEmailOn ?? this.isEmailOn,
          isSMSPhoneOn: isSMSPhoneOn ?? this.isSMSPhoneOn,
          isNotificationOn: isNotificationOn ?? this.isNotificationOn,
          status: status ?? this.status,
          isValid: isValid ?? this.isValid,
          errorMessage: errorMessage ?? this.errorMessage);

  Map<String, dynamic> toMap() {
    return {
      'isEmailOn': isEmailOn,
      'isSMSPhoneOn': isSMSPhoneOn,
      'isNotificationOn': isNotificationOn,
      'status': status.toString(),
      'isValid': isValid,
      'errorMessage': errorMessage,
    };
  }


  factory SetPreferencesState.fromMap(Map<String, dynamic> map) {
    return SetPreferencesState(
      isEmailOn: map['isEmailOn'] as bool,
      isSMSPhoneOn: map['isSMSPhoneOn'] as bool,
      isNotificationOn: map['isNotificationOn'] as bool,
      status: (map['status'] as String).stringToFormzStatus ?? FormzSubmissionStatus.initial,
      isValid: map['isValid'] as bool,
      errorMessage: map['errorMessage'] as String,
    );
  }
}
