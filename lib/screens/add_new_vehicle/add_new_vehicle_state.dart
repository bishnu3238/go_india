import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../common/common.dart';


class AddNewVehicleState extends Equatable {
  final String vehicleTypeId;
  final VehicleNumber vehicleNo;
  final VehicleNumber reVehicleNo;

  final FormzSubmissionStatus status;
  final bool isValid;

  const AddNewVehicleState({
    this.vehicleTypeId = '',
    this.vehicleNo = const VehicleNumber.pure(),
    this.reVehicleNo = const VehicleNumber.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
  });

  AddNewVehicleState copyWith({
    String? vehicleTypeId,
    VehicleNumber? vehicleNo,
    VehicleNumber? reVehicleNo,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) {
    return AddNewVehicleState(
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      vehicleNo: vehicleNo ?? this.vehicleNo,
      reVehicleNo: reVehicleNo?? this.reVehicleNo,
      status: status ?? this.status,

      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [vehicleTypeId, vehicleNo,reVehicleNo, status, isValid];
}
