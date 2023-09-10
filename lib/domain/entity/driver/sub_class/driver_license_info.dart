import '../../../../utility/utility/utility.dart';

class DrivingLicenseInfo {
  final String drivingLicenseNo;
  final String drivingLicenseImage;
  final String drivingLicenseImageBack;
  final String dateOfBirth;
  static const DrivingLicenseInfo empty = DrivingLicenseInfo(
    drivingLicenseNo: 'WB-22-CK-7005',
    drivingLicenseImage: placeHolder,
    drivingLicenseImageBack: placeHolder,
    dateOfBirth: '',
  );

  const DrivingLicenseInfo({
    required this.drivingLicenseNo,
    required this.drivingLicenseImage,
    required this.drivingLicenseImageBack,
    required this.dateOfBirth,
  });

  @override
  String toString() {
    return 'DrivingLicenseInfo{ drivingLicenseNo: $drivingLicenseNo, dateOfBirth: $dateOfBirth, ';
  }

  DrivingLicenseInfo copyWith({
    String? drivingLicenseNo,
    String ?drivingLicenseImage,
    String? drivingLicenseImageBack,
    String? dateOfBirth,
  }) {
    return DrivingLicenseInfo(
      drivingLicenseNo : drivingLicenseNo?? this.drivingLicenseNo,
      drivingLicenseImage: drivingLicenseImage?? this.drivingLicenseImage,
      drivingLicenseImageBack: drivingLicenseImageBack?? this.drivingLicenseImageBack,
      dateOfBirth: dateOfBirth?? this.dateOfBirth,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'drivingLicenseNo': drivingLicenseNo,
      'drivingLicenseImage': drivingLicenseImage,
      'drivingLicenseImageBack': drivingLicenseImageBack,
      'dateOfBirth': dateOfBirth,
    };
  }

  factory DrivingLicenseInfo.fromMap(Map<String, dynamic> map) {
    return DrivingLicenseInfo(
      drivingLicenseNo: map['drivingLicenseNo'] as String,
      drivingLicenseImage: map['drivingLicenseImage'] as String,
      drivingLicenseImageBack: map['drivingLicenseImageBack'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
    );
  }
}
