import 'package:go_india/package/common/common.dart';
import '../../../data/model/driver/export.dart';
import '../../../domain/entity/entity.dart';

class DriverDetailsJson {
  String city, cityId, driverId;
  PanInfoJson panInfoJson;
  BankInfoJson bankInfoJson;
  AadhaarInfoJson aadhaarInfoJson;
  FitnessInfoJson fitnessInfoJson;
  DrivingLicenseInfoJson drivingLicenseInfoJson;

  DriverDetailsJson({
    required this.city,
    required this.cityId,
    required this.driverId,
    required this.bankInfoJson,
    required this.drivingLicenseInfoJson,
    required this.aadhaarInfoJson,
    required this.panInfoJson,
    required this.fitnessInfoJson,
  });

  @override
  String toString() {
    return 'DriverDetailsJson{ city: $city, cityId: $cityId, bankInfoJson: $bankInfoJson, drivingLicenseInfoJson: $drivingLicenseInfoJson, aadhaarInfoJson: $aadhaarInfoJson, panInfoJson: $panInfoJson, fitnessInfoJson: $fitnessInfoJson,}';
  }

  DriverDetailsJson copyWith({
    String? city,
    String? cityId,
    String? driverId,
    BankInfoJson? bankInfoJson,
    DrivingLicenseInfoJson? drivingLicenseInfoJson,
    AadhaarInfoJson? aadhaarInfoJson,
    PanInfoJson? panInfoJson,
    FitnessInfoJson? fitnessInfoJson,
  }) {
    return DriverDetailsJson(
      city: city ?? this.city,
      cityId: cityId ?? this.cityId,
      driverId: driverId ?? this.driverId,
      bankInfoJson: bankInfoJson ?? this.bankInfoJson,
      drivingLicenseInfoJson:
          drivingLicenseInfoJson ?? this.drivingLicenseInfoJson,
      aadhaarInfoJson: aadhaarInfoJson ?? this.aadhaarInfoJson,
      panInfoJson: panInfoJson ?? this.panInfoJson,
      fitnessInfoJson: fitnessInfoJson ?? this.fitnessInfoJson,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'city_id': cityId,
      'driverId': driverId,
      'bankInfoJson': bankInfoJson,
      'drivingLicenseInfoJson': drivingLicenseInfoJson,
      'aadhaarInfoJson': aadhaarInfoJson,
      'panInfoJson': panInfoJson,
      'fitnessInfoJson': fitnessInfoJson,
    };
  }

  factory DriverDetailsJson.fromMap(Map<String, dynamic> json) {
    return DriverDetailsJson(
      city: json['city'] as String? ?? '',
      cityId: (json['city_id'] as Object?).str,
      driverId: json['driver_id'] as String? ?? '',
      bankInfoJson: BankInfoJson.fromMap(json['bankInfo'] ?? json),
      drivingLicenseInfoJson:
          DrivingLicenseInfoJson.fromMap(json['drivingLicenseInfo'] ?? json),
      aadhaarInfoJson: AadhaarInfoJson.fromMap(json['aadhaarInfo'] ?? json),
      panInfoJson: PanInfoJson.fromMap(json['panInfo'] ?? json),
      fitnessInfoJson: FitnessInfoJson.fromMap(json['fitnessInfo'] ?? json),
    );
  }

  DriverDetails toDomain() => DriverDetails(
      city: city,
      cityId: cityId,
      driverId: driverId,
      panInfo: panInfoJson.toDomain(),
      bankInfo: bankInfoJson.toDomain(),
      fitnessInfo: fitnessInfoJson.toDomain(),
      aadhaarInfo: aadhaarInfoJson.toDomain(),
      drivingLicenseInfo: drivingLicenseInfoJson.toDomain());
}
