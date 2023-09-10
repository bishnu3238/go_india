import 'package:formz/formz.dart';
import 'package:go_india/domain/entity/driver/sub_class/vehicle_info.dart';
import 'package:go_india/package/package/package.dart';

enum YesNo { yes, no }

enum IdDoc { dl, aadhaar, others }

class IdentityDetailsState {
  const IdentityDetailsState(
      {this.isVehicleOwner = YesNo.yes,
      this.isVehicleOlderThenYear = YesNo.yes,
      this.currentLocalAddressIn = IdDoc.dl,
      this.status = FormzSubmissionStatus.initial,
      this.isValid = true,
      this.errorMessage = ''});

  IdentityDetailsState.init(VehicleInfo vehicleInfo)
      : isVehicleOwner = (vehicleInfo.isVehicleOwner).boolToYesNo,
        isVehicleOlderThenYear = vehicleInfo.isVehicleOlderThenYear.boolToYesNo,
        currentLocalAddressIn = vehicleInfo.currentLocalAddress.stringToIdDoc,
        status = FormzSubmissionStatus.initial,
        isValid = true,
        errorMessage = '';

  final YesNo isVehicleOwner;
  final YesNo isVehicleOlderThenYear;
  final IdDoc currentLocalAddressIn;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  @override
  String toString() {
    return 'IdentityDetailsState{yesNoOne: $isVehicleOwner, yesNoTwo: $isVehicleOlderThenYear, idDoc: $currentLocalAddressIn, status: $status, isValid: $isValid, errorMessage: $errorMessage}';
  }

  IdentityDetailsState copyWith({
    YesNo? isVehicleOwner,
    YesNo? isVehicleOlderThenYear,
    IdDoc? currentLocalAddressIn,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      IdentityDetailsState(
          isVehicleOwner: isVehicleOwner ?? this.isVehicleOwner,
          isVehicleOlderThenYear:
              isVehicleOlderThenYear ?? this.isVehicleOlderThenYear,
          currentLocalAddressIn:
              currentLocalAddressIn ?? this.currentLocalAddressIn,
          status: status ?? this.status,
          isValid: isValid ?? this.isValid,
          errorMessage: errorMessage ?? this.errorMessage);
}
