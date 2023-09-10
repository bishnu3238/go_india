import 'package:go_india/domain/entity/entity.dart';

class AadhaarInfoJson {
  final String aadhaarNo, aadhaarImage, aadhaarImageBack, status;

  const AadhaarInfoJson({
    required this.aadhaarNo,
    required this.aadhaarImage,
    required this.aadhaarImageBack,
    required this.status,
  });

  factory AadhaarInfoJson.fromMap(Map<String, dynamic> json) {
    return AadhaarInfoJson(
      aadhaarNo: json['aadhar_number'] as String? ?? '',
      aadhaarImage: json['aadhar_photo'] as String? ?? '',
      aadhaarImageBack: json['aadhar_photo_back'] as String? ?? '',
      status: json[''] as String? ?? '',
    );
  }

  AadhaarInfo toDomain() => AadhaarInfo(
      aadhaarNo: aadhaarNo,
      aadhaarImage: aadhaarImage,
      aadhaarImageBack: aadhaarImageBack,
      status: int.tryParse(status) ?? 0);
}
