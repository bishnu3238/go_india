
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';


class PollutionState{
  PollutionState({
    this.pollutionImage =const  [],
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage = ''});


  final List<XFile?> pollutionImage;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  PollutionState copyWith({
    List<XFile?>? pollutionImage,
      FormzSubmissionStatus? status,
      bool? isValid,
      String? errorMessage,

})=>PollutionState(
    pollutionImage: pollutionImage ?? this.pollutionImage,
    status: status?? this.status,
    errorMessage: errorMessage?? this.errorMessage,
    isValid: isValid?? this.isValid,


  );
}