import 'package:go_india/domain/entity/driver/sub_class/vehicle_info.dart';

class DriverVehicleInfo {
  final String id, driverId, status, date, time;
  final VehicleInfo vehicleInfo;

  const DriverVehicleInfo({
    required this.id,
    required this.driverId,
    required this.status,
    required this.date,
    required this.time,
    required this.vehicleInfo,
  });

  @override
  String toString() => 'DriverVehicleInfo{id: $id, driverId: $driverId, status: $status, date: $date, time: $time, vehicleInfo: $vehicleInfo}';

  static const DriverVehicleInfo empty = DriverVehicleInfo(
    id: '0',
    driverId: '0',
    status: '0',
    date: 'date',
    time: 'time',
    vehicleInfo: VehicleInfo.empty,
  );

  DriverVehicleInfo copyWith({
    String? id,
    String? driverId,
    String? status,
    String? date,
    String? time,
    VehicleInfo? vehicleInfo,
  }) {
    return DriverVehicleInfo(
      id: id ?? this.id,
      driverId: driverId ?? this.driverId,
      status: status ?? this.status,
      date: date ?? this.date,
      time: time ?? this.time,
      vehicleInfo: vehicleInfo ?? this.vehicleInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'driverId': driverId,
      'status': status,
      'date': date,
      'time': time,
      'vehicleInfo': vehicleInfo.toMap(),
    };
  }

  factory DriverVehicleInfo.fromMap(Map<String, dynamic> map) {
    return DriverVehicleInfo(
      id: map['id'] as String ? ?? '',
      driverId: map['driverId'] as String? ?? '',
      status: map['status'] as String ? ?? '0',
      date: map['date'] as String ? ?? '',
      time: map['time'] as String ? ?? '',
      vehicleInfo: VehicleInfo.fromMap(map),
    );
  }
}
