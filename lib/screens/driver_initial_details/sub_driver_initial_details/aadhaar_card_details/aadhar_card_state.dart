import 'package:formz/formz.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:image_picker/image_picker.dart';

class AadhaarCardState {
  final List<XFile?> aadhaarImageOne;
  final List<XFile?> aadhaarImageTwo;
  final AadhaarNumber aadhaarNumber;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final bool isValid;

  AadhaarCardState({
    this.aadhaarNumber = const AadhaarNumber.pure(),
    this.aadhaarImageOne = const [],
    this.aadhaarImageTwo = const [],
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage = '',
    this.isValid = false,
  });

  AadhaarCardState copyWith({
    AadhaarNumber? aadhaarNumber,
    List<XFile?>? aadhaarImageOne,
    List<XFile?>? aadhaarImageTwo,
    String? errorMessage,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) =>
      AadhaarCardState(
        aadhaarNumber: aadhaarNumber ?? this.aadhaarNumber,
        aadhaarImageOne: aadhaarImageOne ?? this.aadhaarImageOne,
        aadhaarImageTwo: aadhaarImageTwo ?? this.aadhaarImageTwo,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        isValid: isValid ?? this.isValid,
      );
}
