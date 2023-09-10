import 'package:dartz/dartz.dart';
import 'package:go_india/domain/repository/driver_repository.dart';

import '../../domain/entity/entity.dart';
import '../../domain/failure/failure.dart';
import '../../domain/store/store.dart';
import '../../package/package/package.dart';
import '../../utility/utility/utility.dart';
import '../model/model.dart';

class GoDriverRepository implements DriverRepository {
  final NetworkService networkService;
  final DriverStore driverStore;
  final DriverVehicleStore driverDetailsStore;
  GoDriverRepository(
      this.networkService, this.driverDetailsStore, this.driverStore);

  @override
  Future<Either<Failure, Driver>> getDriver(String id) async {
    final url = '$fetchDriverApi?driver_id=$id';
    url.log();
    return await networkService.get(url).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) {
              '$url:: :: $r'.log();
              var driver = DriverJson.fromMap(r['driver']).toDomain();
              var details = DriverDetailsJson.fromMap(r['driver']).toDomain();
              var data = driver.copyWith(driverDetails: details);
              driverStore.setDriver(data);
              return right(data);
            },
          ),
        );
  }

  @override
  Future<Either<Failure, Driver>> newDriver(Map<String, String> data) async {
    return await networkService.post(createDriverApi, data).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) {
              var id = r['driver_id'].toString();
              Driver driver = driverStore.state.copyWith(id: id);
              driverStore.setDriver(driver);
              return right(driver);
            },
          ),
        );
  }

  @override
  Future<Either<Failure, Driver>> updateDriver(Map<String, String> data) async {
    return await networkService.post(updateDriverApi, data).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) {
              var driver = DriverJson.fromMap(r['driver']).toDomain();
              var details = DriverDetailsJson.fromMap(r['driver']).toDomain();
              var data = driver.copyWith(driverDetails: details);
              driverStore.setDriver(data);
              return right(data);
        },
      ),
    );
  }

  @override
  Future<Either<Failure, Driver>> logInDriver(Map<String, String> data) async {
    return await networkService.post(logInDriverApi, data).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) {
              var driver = DriverJson.fromMap(r['driver']).toDomain();
              var details = DriverDetailsJson.fromMap(r['driver']).toDomain();
              var data = driver.copyWith(driverDetails: details);
              return right(data);
            },
          ),
        );
  }

  @override
  Future<Either<Failure, bool>> checkPhoneNo(Map<String, String> data) async {
    return await networkService.post(checkPhoneNoApi, data).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) {
              if(r['success'] ){
                var driver = DriverJson.fromMap(r['driver']).toDomain();
                var details = DriverDetailsJson.fromMap(r['driver']).toDomain();
                var data = driver.copyWith(driverDetails: details);
                driverStore.setDriver(data);
              }
              return right(r['success']);
            },
          ),
        );
  }
}
