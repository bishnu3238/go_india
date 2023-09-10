import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/entity.dart';

class VehicleTypeStore extends Cubit<List<VehicleType>> {
  VehicleTypeStore() : super([]);

  void setVehicleStore(List<VehicleType> vehicle) => emit(vehicle);
}
