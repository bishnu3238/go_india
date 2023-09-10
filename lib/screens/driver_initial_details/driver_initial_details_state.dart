import 'package:formz/formz.dart';
import 'package:go_india/package/common/common.dart';

class DriverInitialDetailsState {
  final bool isBankDetailsDone,
      isProfileDone,
      isDrivingLicenseDone,
      isAadhaarDone,
      isRcDone,
      isPollutionDone,
      isPanDone,
      isVehiclePermitDone,
      isFitnessDone,
      isVehicleAuditDone,
      isIdentityDetailsDone,
      isVehicleInsuranceDone;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  const DriverInitialDetailsState({
    this.isBankDetailsDone = false,
    this.isProfileDone = false,
    this.isDrivingLicenseDone = false,
    this.isAadhaarDone = false,
    this.isRcDone = false,
    this.isPollutionDone = false,
    this.isPanDone = false,
    this.isVehiclePermitDone = false,
    this.isFitnessDone = false,
    this.isVehicleAuditDone = false,
    this.isIdentityDetailsDone = false,
    this.isVehicleInsuranceDone = false,
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage = '',
  });

  bool get isAllDone =>
      isBankDetailsDone &&
      isProfileDone &&
      isDrivingLicenseDone &&
      isAadhaarDone &&
      isRcDone &&
      isPollutionDone &&
      isPanDone &&
      isVehiclePermitDone &&
      isFitnessDone &&
      isVehicleAuditDone &&
      isIdentityDetailsDone &&
      isVehicleInsuranceDone;

  DriverInitialDetailsState copyWith({
    bool? isBankDetailsDone,
    bool? isProfileDone,
    bool? isDrivingLicenseDone,
    bool? isAadhaarDone,
    bool? isRcDone,
    bool? isPollutionDone,
    bool? isPanDone,
    bool? isVehiclePermitDone,
    bool? isFitnessDone,
    bool? isVehicleAuditDone,
    bool? isIdentityDetailsDone,
    bool? isVehicleInsuranceDone,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return DriverInitialDetailsState(
      isBankDetailsDone: isBankDetailsDone ?? this.isBankDetailsDone,
      isProfileDone: isProfileDone ?? this.isProfileDone,
      isDrivingLicenseDone: isDrivingLicenseDone ?? this.isDrivingLicenseDone,
      isAadhaarDone: isAadhaarDone ?? this.isAadhaarDone,
      isRcDone: isRcDone ?? this.isRcDone,
      isPollutionDone: isPollutionDone ?? this.isPollutionDone,
      isPanDone: isPanDone ?? this.isPanDone,
      isVehiclePermitDone: isVehiclePermitDone ?? this.isVehiclePermitDone,
      isFitnessDone: isFitnessDone ?? this.isFitnessDone,
      isIdentityDetailsDone:
          isIdentityDetailsDone ?? this.isIdentityDetailsDone,
      isVehicleAuditDone: isVehicleAuditDone ?? this.isVehicleAuditDone,
      isVehicleInsuranceDone:
          isVehicleInsuranceDone ?? this.isVehicleInsuranceDone,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() {
    return 'DriverInitialDetailsState{isBankDetailsDone: $isBankDetailsDone, isProfileDone: $isProfileDone, isDrivingLicenseDone: $isDrivingLicenseDone, isAadhaarDone: $isAadhaarDone, isRcDone: $isRcDone, isPollutionDone: $isPollutionDone, isPanDone: $isPanDone, isVehiclePermitDone: $isVehiclePermitDone, isFitnessDone: $isFitnessDone, isVehicleAuditDone: $isVehicleAuditDone, isIdentityDetailsDone: $isIdentityDetailsDone, isVehicleInsuranceDone: $isVehicleInsuranceDone, status: $status, isValid: $isValid, errorMessage: $errorMessage}';
  }

  Map<String, dynamic> toMap() {
    return {
      'isBankDetailsDone': isBankDetailsDone,
      'isProfileDone': isProfileDone,
      'isDrivingLicenseDone': isDrivingLicenseDone,
      'isAadhaarDone': isAadhaarDone,
      'isRcDone': isRcDone,
      'isPollutionDone': isPollutionDone,
      'isPanDone': isPanDone,
      'isVehiclePermitDone': isVehiclePermitDone,
      'isFitnessDone': isFitnessDone,
      'isVehicleAuditDone': isVehicleAuditDone,
      'isIdentityDetailsDone': isIdentityDetailsDone,
      'isVehicleInsuranceDone': isVehicleInsuranceDone,
      'status': status.name,
      'isValid': isValid,
      'errorMessage': errorMessage,
    };
  }

  factory DriverInitialDetailsState.fromMap(Map<String, dynamic> map) {
    return DriverInitialDetailsState(
      isBankDetailsDone: map['isBankDetailsDone'] as bool,
      isProfileDone: map['isProfileDone'] as bool,
      isDrivingLicenseDone: map['isDrivingLicenseDone'] as bool,
      isAadhaarDone: map['isAadhaarDone'] as bool,
      isRcDone: map['isRcDone'] as bool,
      isPollutionDone: map['isPollutionDone'] as bool,
      isPanDone: map['isPanDone'] as bool,
      isVehiclePermitDone: map['isVehiclePermitDone'] as bool,
      isFitnessDone: map['isFitnessDone'] as bool,
      isVehicleAuditDone: map['isVehicleAuditDone'] as bool,
      isIdentityDetailsDone: map['isIdentityDetailsDone'] as bool,
      isVehicleInsuranceDone: map['isVehicleInsuranceDone'] as bool,
      status: (map['status'] as String).stringToFormzStatus ??
          FormzSubmissionStatus.initial,
      isValid: map['isValid'] as bool,
      errorMessage: map['errorMessage'] as String,
    );
  }
}
