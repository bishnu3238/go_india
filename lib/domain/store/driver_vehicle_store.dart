
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../entity/entity.dart';

class DriverVehicleStore extends HydratedCubit<DriverVehicleInfo> {
  DriverVehicleStore() : super(DriverVehicleInfo.empty);

  void setDriverVehicle(DriverVehicleInfo vehicleInfo) => emit(vehicleInfo);

  @override
  DriverVehicleInfo? fromJson(Map<String, dynamic> json) =>
      DriverVehicleInfo.fromMap(json);

  @override
  Map<String, dynamic>? toJson(DriverVehicleInfo state) => state.toMap();
}
