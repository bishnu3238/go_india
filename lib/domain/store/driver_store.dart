import 'package:go_india/data/model/driver/driver_details_json.dart';
import 'package:go_india/data/model/driver/driver_json.dart';
import 'package:go_india/package/package/package.dart';
 import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../entity/entity.dart';

class DriverStore extends HydratedCubit<Driver> {
  DriverStore() : super(Driver.empty);

  void setDriver(Driver driver) => emit(driver);

  @override
  Driver? fromJson(Map<String, dynamic> json) {

    '+++++++++++++++++++++++++++'.log();
    '$json'.log();
    '+++++++++++++++++++++++++++******************'.log();

    var driver = DriverJson.fromMap(json).toDomain();
    var driverDetails = DriverDetailsJson.fromMap(json['driverDetails']);
    driver = driver.copyWith(driverDetails: driverDetails.toDomain());
    return json['id'] == '0' && json['authStatus']  != 'authenticated' ? Driver.empty : driver;
   }

  @override
  Map<String, dynamic>? toJson(Driver state) => state.toMap();
}
