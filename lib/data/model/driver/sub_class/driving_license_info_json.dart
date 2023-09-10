import '../../../../../utility/utility/utility.dart';
import '../../../../domain/entity/entity.dart';

class DrivingLicenseInfoJson {
  final String drivingLicenseNo;
  final String drivingLicenseImage;
  final String drivingLicenseImageBack;
  final String dateOfBirth;

  const DrivingLicenseInfoJson({
    required this.drivingLicenseNo,
    required this.drivingLicenseImage,
    required this.drivingLicenseImageBack,
    required this.dateOfBirth,
  });

  @override
  String toString() {
    return 'DrivingLicenseInfo{ drivingLicenseNo: $drivingLicenseNo, dateOfBirth: $dateOfBirth, ';
  }

  DrivingLicenseInfoJson copyWith({
    String? drivingLicenseNo,
    String? drivingLicenseImage,
    String? drivingLicenseImageBack,
    String? dateOfBirth,
  }) {
    return DrivingLicenseInfoJson(
      drivingLicenseNo: drivingLicenseNo ?? this.drivingLicenseNo,
      drivingLicenseImage: drivingLicenseImage ?? this.drivingLicenseImage,
      drivingLicenseImageBack:
          drivingLicenseImageBack ?? this.drivingLicenseImageBack,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  factory DrivingLicenseInfoJson.fromMap(Map<String, dynamic> json) =>
      DrivingLicenseInfoJson(
        drivingLicenseNo: json['driver_license_number'] as String? ?? '',
        drivingLicenseImage:
            json['driving_license_photo'] as String? ?? placeHolder,
        drivingLicenseImageBack:
            json['driving_license_photo'] as String? ?? placeHolder,
        dateOfBirth: json['dob'] as String? ?? '',
      );

  DrivingLicenseInfo toDomain() => DrivingLicenseInfo(
      drivingLicenseNo: drivingLicenseNo,
      drivingLicenseImage: drivingLicenseImage,
      drivingLicenseImageBack: drivingLicenseImageBack,
      dateOfBirth: dateOfBirth);
}
