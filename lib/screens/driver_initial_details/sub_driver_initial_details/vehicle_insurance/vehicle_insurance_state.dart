import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

class VehicleInsuranceState {
  VehicleInsuranceState(
      {this.insuranceImage = const [],
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage = ''});
  final List<XFile?> insuranceImage;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  VehicleInsuranceState copyWith({
    List<XFile?>? insuranceImage,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      VehicleInsuranceState(
          insuranceImage: insuranceImage ?? this.insuranceImage,
          status: status ?? this.status,
          isValid: isValid ?? this.isValid,
          errorMessage: errorMessage ?? this.errorMessage);
}
