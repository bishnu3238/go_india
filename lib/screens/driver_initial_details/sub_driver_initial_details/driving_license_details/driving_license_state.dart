import 'package:formz/formz.dart';
import 'package:go_india/package/input_field_models/dob_validator.dart';
import 'package:go_india/screens/common/common_validator/driving_license_validator.dart';
import 'package:image_picker/image_picker.dart';

class DrivingLicenseState {
  const DrivingLicenseState(
      {this.dob = const DateOfBirth.empty(),
      this.dlNumber = const DLNumber.pure(),
      this.dlImage = const [],
      this.dlBackImage = const [],
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage = ''});

  final DLNumber dlNumber;
  final DateOfBirth dob;
  final List<XFile?> dlImage;
  final List<XFile?> dlBackImage;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  @override
  String toString() {
    return 'DrivingLicenseState{dlNumber: $dlNumber, dob: $dob, dlImage: $dlImage, dlBackImage: $dlBackImage, status: $status, isValid: $isValid, errorMessage: $errorMessage}';
  }

  DrivingLicenseState copyWith({
    DLNumber? dlNumber,
    DateOfBirth? dob,
    List<XFile?>? dlImage,
    List<XFile?>? dlBackImage,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      DrivingLicenseState(
          dlNumber: dlNumber ?? this.dlNumber,
          dob: dob ?? this.dob,
          dlImage: dlImage ?? this.dlImage,
          dlBackImage: dlBackImage ?? this.dlBackImage,
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage,
          isValid: isValid ?? this.isValid);
}
