import 'package:dartz/dartz.dart';
import 'package:go_india/package/package/package.dart';
import '../../data/model/model.dart';
import '../../domain/entity/entity.dart';
import '../../domain/failure/failure.dart';
import '../../domain/repository/repository.dart';
import '../../utility/utility/utility.dart';
import '../../domain/store/store.dart';

class GoDriverDetailsRepository implements DriverDetailsRepository {
  final NetworkService networkService;
  final VehicleTypeStore vehicleTypeStore;
  final DriverVehicleStore vehicleStore;
  GoDriverDetailsRepository(
      this.networkService, this.vehicleStore, this.vehicleTypeStore);

  @override
  Future<Either<Failure, DriverVehicleInfo>> getVehicleDetails(
      Map<String, String> data) async {
    return await networkService.post(getVehicleDetailsApi, data).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) {
              var data = r['vehicle'];
              var info = DriverVehicleInfoJson.fromMap(data).toDomain();
              vehicleStore.setDriverVehicle(info);
              return right(info);
            },
          ),
        );
  }

  @override
  Future<Either<Failure, List<VehicleType>>> getVehicleTypes() async {
    return await networkService.get(getVehicleTypesApi).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) {
              List data = r['vehicle_type'];
              List<VehicleType> vehicleTypes = data
                  .map<VehicleType>(
                      (e) => VehicleTypeJson.fromMap(e).toDomain())
                  .toList();

              vehicleTypeStore.setVehicleStore(vehicleTypes);
              return right(vehicleTypes);
            },
          ),
        );
  }

  @override
  Future<Either<Failure, dynamic>> submitVehicleDetails(
      Map<String, String> data) async {
    return await networkService.post(submitDriverVehicleApi, data).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) => right(true),
          ),
        );
  }

  @override
  Future<Either<Failure, bool>> submitBankDetails(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitBankDetailsApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitAadhaarDetails(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitAadhaarDetailsApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitProfilePicture(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitProfilePictureApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitDrivingLicenseDetails(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitDrivingLicenseApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitRcCertificateDetails(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitRcDetailsApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitPanCardDetails(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitPanCardApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitVehiclePermitDetails(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitVehiclePermitApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitFitnessDetails(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitFitnessDetailsApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitVehicleAuditDetails(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitVehicleAuditDetailsApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitPollutionCertificateDetails(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitPollutionApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitVehicleInsuranceDetails(
      Map<String, String> data, Map<String, dynamic> images) async {
    return await networkService
        .postRequest(submitVehicleInsuranceApi, data, images)
        .then((value) => value.fold(
              (l) => left(Failure(l.error)),
              (r) => right(true),
            ));
  }

  @override
  Future<Either<Failure, bool>> submitIdentityDetails(
      Map<String, String> data) async {
    return await networkService.post(submitIdentityDetailsApi, data).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) => right(true),
          ),
        );
  }

  @override
  Future<Either<Failure, bool>> submitAllDetails(
      Map<String, String> data) async {
    return await networkService.post(submitAllApplicationApi, data).then(
          (value) => value.fold(
            (l) => left(Failure(l.error)),
            (r) => right(true),
          ),
        );
  }
}
