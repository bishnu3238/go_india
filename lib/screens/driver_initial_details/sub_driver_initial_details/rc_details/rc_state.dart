import 'package:formz/formz.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:image_picker/image_picker.dart';

enum RcType { self, rented }

class RcState {
  final List<XFile?> rcImageOne;
  final List<XFile?> rcImageTwo;
  final VehicleNumber vehicleNumber;
  final RcType rcType;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final bool isValid;

  RcState({
    this.vehicleNumber = const VehicleNumber.pure(),
    this.rcImageOne = const [],
    this.rcImageTwo = const [],
    this.rcType = RcType.self,
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage = '',
    this.isValid = false,
  });

  @override
  String toString() {
    return 'RcState{rcImageOne: $rcImageOne, rcImageTwo: $rcImageTwo, rcNumber: $vehicleNumber, rcType: $rcType, status: $status, errorMessage: $errorMessage, isValid: $isValid}';
  }

  RcState copyWith({
    VehicleNumber? vehicleNumber,
    List<XFile?>? rcImageOne,
    List<XFile?>? rcImageTwo,
    RcType? rcType,
    String? errorMessage,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) =>
      RcState(
        vehicleNumber: vehicleNumber ?? this.vehicleNumber,
        rcImageOne: rcImageOne ?? this.rcImageOne,
        rcImageTwo: rcImageTwo ?? this.rcImageTwo,
        rcType: rcType?? this.rcType,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        isValid: isValid ?? this.isValid,
      );
}
