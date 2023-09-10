import 'package:go_india/domain/entity/driver/sub_class/vehicle_info.dart';
import 'package:go_india/package/common/common.dart';

class VehicleInfoJson {
  String vehicleTypeId, vehicleNo, currentLocalAddress;
  bool isVehicleOwner, isVehicleOlderThenYear, hasVehiclePermit;
  String? rcImage,
      pollutionImage,
      insuranceImage,
      vehiclePermit,
      vehicleFontImage,
      vehicleBackImage;

  VehicleInfoJson({
    required this.vehicleTypeId,
    required this.vehicleNo,
    required this.currentLocalAddress,
    required this.isVehicleOwner,
    required this.isVehicleOlderThenYear,
    required this.hasVehiclePermit,
    this.rcImage,
    this.pollutionImage,
    this.insuranceImage,
    this.vehiclePermit,
    this.vehicleFontImage,
    this.vehicleBackImage,
  });

  @override
  String toString() {
    return 'VehicleInfoJson{ vehicleTypeId: $vehicleTypeId, vehicleNo: $vehicleNo, currentLocalAddress: $currentLocalAddress, isVehicleOwener: $isVehicleOwner, isVehicleOlderThenYear: $isVehicleOlderThenYear, hasVahiclePermit: $hasVehiclePermit, rcImage: $rcImage, pollutionImage: $pollutionImage, insuranceImage: $insuranceImage, vehiclePermit: $vehiclePermit, vehicleFontImage: $vehicleFontImage, vehicleBackImage: $vehicleBackImage }';
  }

  VehicleInfoJson copyWith({
    String? vehicleTypeId,
    String? vehicleNo,
    String? currentLocalAddress,
    bool? isVehicleOwner,
    bool? isVehicleOlderThenYear,
    bool? hasVehiclePermit,
    String? rcImage,
    String? pollutionImage,
    String? insuranceImage,
    String? vehiclePermit,
    String? vehicleFontImage,
    String? vehicleBackImage,
  }) {
    return VehicleInfoJson(
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      vehicleNo: vehicleNo ?? this.vehicleNo,
      currentLocalAddress: currentLocalAddress ?? this.currentLocalAddress,
      isVehicleOwner: isVehicleOwner ?? this.isVehicleOwner,
      isVehicleOlderThenYear:
          isVehicleOlderThenYear ?? this.isVehicleOlderThenYear,
      hasVehiclePermit: hasVehiclePermit ?? this.hasVehiclePermit,
      rcImage: rcImage ?? this.rcImage,
      pollutionImage: pollutionImage ?? this.pollutionImage,
      insuranceImage: insuranceImage ?? this.insuranceImage,
      vehiclePermit: vehiclePermit ?? this.vehiclePermit,
      vehicleFontImage: vehicleFontImage ?? this.vehicleFontImage,
      vehicleBackImage: vehicleBackImage ?? this.vehicleBackImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vehicle_type': vehicleTypeId,
      'vehicle_number': vehicleNo,
      'current_local_address': currentLocalAddress,
      'is_vehicle_owner': isVehicleOwner,
      'is_vehicle_older_than_year': isVehicleOlderThenYear,
      'has_vehicle_permit': hasVehiclePermit,
      'registration_certificate_photo': rcImage,
      'pollution_certificate_photo': pollutionImage,
      'insurance_photo': insuranceImage,
      'vehicle_permit': vehiclePermit,
      'vehicle_front_photo': vehicleFontImage,
      'vehicle_back_photo': vehicleBackImage,
    };
  }

  factory VehicleInfoJson.fromMap(Map<String, dynamic> map) {
    return VehicleInfoJson(
      vehicleTypeId: (map['vehicle_type'] as Object?).str,
      vehicleNo: (map['vehicle_number'] as Object?).str,
      currentLocalAddress: map['current_local_address'] as String? ?? '',
      isVehicleOwner: (map['is_vehicle_owner'] as Object?).str.toBool,
      isVehicleOlderThenYear:
          (map['is_vehicle_older_than_year'] as Object?).str.toBool,
      hasVehiclePermit: (map['has_vehicle_permit'] as Object?).str.toBool,
      rcImage: (map['registration_certificate_photo'] as Object?).str,
      pollutionImage: (map['pollution_certificate_photo'] as Object?).str,
      insuranceImage: (map['insurance_photo'] as Object?).str,
      vehiclePermit: (map['vehicle_permit'] as Object?).str,
      vehicleFontImage: (map['vehicle_front_photo'] as Object?).str,
      vehicleBackImage: (map['vehicle_back_photo'] as Object?).str,
    );
  }

  VehicleInfo toDomain() => VehicleInfo(
        vehicleTypeId: vehicleTypeId,
        vehicleNo: vehicleNo,
        currentLocalAddress: currentLocalAddress,
        isVehicleOwner: isVehicleOwner,
        isVehicleOlderThenYear: isVehicleOlderThenYear,
        hasVehiclePermit: hasVehiclePermit,
        pollutionImage: pollutionImage,
        insuranceImage: insuranceImage,
        rcImage: rcImage,
        vehicleBackImage: vehicleBackImage,
        vehicleFontImage: vehicleFontImage,
        vehiclePermit: vehiclePermit,
      );
}
