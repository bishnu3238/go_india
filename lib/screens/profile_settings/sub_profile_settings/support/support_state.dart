
import 'package:formz/formz.dart';


class SupportState{
  SupportState({this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage = ''});
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  SupportState copyWith({

    FormzSubmissionStatus? status,
     bool ?isValid,
     String? errorMessage,
})=>SupportState(status: status?? this.status, isValid: isValid?? this.isValid, errorMessage: errorMessage?? this.errorMessage);
}