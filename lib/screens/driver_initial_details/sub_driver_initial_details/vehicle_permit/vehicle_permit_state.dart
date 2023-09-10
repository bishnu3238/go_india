import 'package:formz/formz.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:image_picker/image_picker.dart';

class VehiclePermitState {
  VehiclePermitState(
      {this.isPermitIssued = YesNo.no,
      this.vehiclePermitImage = const [],
      this.form7Image = const [],
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage = ''});

  final YesNo isPermitIssued;
  final List<XFile?> vehiclePermitImage;
  final List<XFile?> form7Image;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  VehiclePermitState copyWith({
    YesNo? isPermitIssued,
    List<XFile?>? vehiclePermitImage,
    List<XFile?>? form7Image,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      VehiclePermitState(
        isPermitIssued: isPermitIssued ?? this.isPermitIssued,
        vehiclePermitImage: vehiclePermitImage ?? this.vehiclePermitImage,
        form7Image: form7Image?? this.form7Image,
        status: status ?? this.status,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
