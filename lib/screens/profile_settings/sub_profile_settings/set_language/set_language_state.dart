
import 'package:formz/formz.dart';


class SetLanguageState{
  SetLanguageState({this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage = ''});
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  SetLanguageState copyWith({

    FormzSubmissionStatus? status,
     bool ?isValid,
     String? errorMessage,
})=>SetLanguageState(status: status?? this.status, isValid: isValid?? this.isValid, errorMessage: errorMessage?? this.errorMessage);
}