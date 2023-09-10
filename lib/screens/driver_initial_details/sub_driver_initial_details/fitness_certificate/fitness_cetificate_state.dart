import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

class FitnessCertificateState {
  FitnessCertificateState(
      {this.fitnessImage = const [],
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage = ''});

  final List<XFile?> fitnessImage;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  FitnessCertificateState copyWith({
    List<XFile?>? fitnessImage,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      FitnessCertificateState(
        fitnessImage: fitnessImage ?? this.fitnessImage,
        status: status ?? this.status,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
