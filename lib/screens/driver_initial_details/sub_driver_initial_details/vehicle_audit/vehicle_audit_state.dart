
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';


class VehicleAuditState{


  VehicleAuditState({

    this.vehicleImageOne= const [],
    this.vehicleImageTwo= const [],
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage = ''}); final List<XFile?> vehicleImageOne;
  final List<XFile?> vehicleImageTwo;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  VehicleAuditState copyWith({
      List<XFile?>? vehicleImageOne,
      List<XFile?>? vehicleImageTwo,
    FormzSubmissionStatus? status,
     bool ?isValid,
     String? errorMessage,
})=>VehicleAuditState(
      vehicleImageOne: vehicleImageOne?? this.vehicleImageOne,
      vehicleImageTwo: vehicleImageTwo?? this.vehicleImageTwo,


      status: status?? this.status, isValid: isValid?? this.isValid, errorMessage: errorMessage?? this.errorMessage);
}