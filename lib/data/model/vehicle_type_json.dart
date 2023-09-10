import 'package:go_india/domain/entity/entity.dart';

class VehicleTypeJson {
  final String id, vehicleType, vehicleImage, status;

  const VehicleTypeJson({
    required this.id,
    required this.vehicleType,
    required this.vehicleImage,
    required this.status,
  });

  factory VehicleTypeJson.fromMap(Map<String, dynamic> json) {
    return VehicleTypeJson(
      id: json['id'].toString(),
      vehicleType: json['vehicle_type'].toString(),
      vehicleImage: json['vehicle_image'].toString(),
      status: json['status'].toString(),
    );
  }

  VehicleType toDomain() => VehicleType(
        id: id,
        vehicleType: vehicleType,
        vehicleImage: vehicleImage,
        status: int.tryParse(status) ?? 0,
      );
}
