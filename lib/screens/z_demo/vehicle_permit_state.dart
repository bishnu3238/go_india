
import 'package:formz/formz.dart';


class DemoState{
  DemoState({this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage = ''});
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  DemoState copyWith({

    FormzSubmissionStatus? status,
     bool ?isValid,
     String? errorMessage,
})=>DemoState(status: status?? this.status, isValid: isValid?? this.isValid, errorMessage: errorMessage?? this.errorMessage);
}