import 'package:equatable/equatable.dart';

class VehicleType extends Equatable {
  final String id, vehicleType, vehicleImage;
  final int status;

  static const  VehicleType empty = VehicleType(
    id: '',
    vehicleType: '',
    vehicleImage: '',
    status: 0,
  );

  const VehicleType({
    required this.id,
    required this.vehicleType,
    required this.vehicleImage,
    required this.status,
  });

  @override
  String toString() {
    return 'VehicleType{ id: $id, vehicleType: $vehicleType status: $status,}';
  }

  VehicleType copyWith({
    String? id,
    String? vehicleType,
    String? vehicleImage,
    int? status,
  }) {
    return VehicleType(
      id: id ?? this.id,
      vehicleType: vehicleType ?? this.vehicleType,
      vehicleImage: vehicleImage ?? this.vehicleImage,
      status: status ?? this.status,
    );
  }

  Map<String, String> toMap() {
    return {
      'id': id.toString(),
      'vehicle_type': vehicleType.toString(),
      'vehicle_image': vehicleImage.toString(),
      'status': status.toString(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        vehicleType,
        status,
      ];
}
