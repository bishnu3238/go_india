import 'package:go_india/data/model/driver/sub_class/vehicle_info_json.dart';
import 'package:go_india/domain/entity/entity.dart';
import 'package:go_india/package/common/common.dart';

class DriverVehicleInfoJson {
  String id, driverId, status, date, time;
  VehicleInfoJson vehicleInfoJson;

  DriverVehicleInfoJson({
    required this.id,
    required this.driverId,
    required this.status,
    required this.date,
    required this.time,
    required this.vehicleInfoJson,
  });

  @override
  String toString() {
    return 'DriverVehicleInfoJson{ id: $id, driverId: $driverId, status: $status, date: $date, time: $time, vehicleInfoJson: $vehicleInfoJson,}';
  }

  DriverVehicleInfoJson copyWith({
    String? id,
    String? driverId,
    String? status,
    String? date,
    String? time,
    VehicleInfoJson? vehicleInfoJson,
  }) {
    return DriverVehicleInfoJson(
      id: id ?? this.id,
      driverId: driverId ?? this.driverId,
      status: status ?? this.status,
      date: date ?? this.date,
      time: time ?? this.time,
      vehicleInfoJson: vehicleInfoJson ?? this.vehicleInfoJson,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'driverId': driverId.toString(),
      'status': status.toString(),
      'date': date.toString(),
      'time': time.toString(),
      'vehicleInfoJson': vehicleInfoJson.toString(),
    };
  }

  factory DriverVehicleInfoJson.fromMap(Map<String, dynamic> map) {
    return DriverVehicleInfoJson(
      id: (map['id']as Object?).str,
      driverId: map['driver_id'] as String? ?? '',
      status: (map['status']as Object?).str,
      date: map['date'] as String? ?? '',
      time: map['time'] as String? ?? '',
      vehicleInfoJson: VehicleInfoJson.fromMap(map),
    );
  }

  DriverVehicleInfo toDomain() => DriverVehicleInfo(
        id: id,
        driverId: driverId,
        status: status,
        date: date,
        time: time,
        vehicleInfo: vehicleInfoJson.toDomain(),
      );
}
