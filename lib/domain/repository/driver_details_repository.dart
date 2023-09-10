import 'package:dartz/dartz.dart';
import '../entity/entity.dart';
import '../failure/failure.dart';

abstract class DriverDetailsRepository {
  Future<Either<Failure, DriverVehicleInfo>> getVehicleDetails(
    Map<String, String> data,
  );
  Future<Either<Failure, List<VehicleType>>> getVehicleTypes();
  Future<Either<Failure, dynamic>> submitVehicleDetails(
    Map<String, String> data,
  );
  Future<Either<Failure, bool>> submitBankDetails(
    Map<String, String> data,
    Map<String, dynamic> images,
  );
  Future<Either<Failure, bool>> submitAadhaarDetails(
    Map<String, String> data,
    Map<String, dynamic> images,
  );

  Future<Either<Failure, bool>> submitProfilePicture(
    Map<String, String> data,
    Map<String, dynamic> images,
  );
  Future<Either<Failure, bool>> submitDrivingLicenseDetails(
    Map<String, String> data,
    Map<String, dynamic> images,
  );
  Future<Either<Failure, bool>> submitRcCertificateDetails(
    Map<String, String> data,
    Map<String, dynamic> images,
  );
  Future<Either<Failure, bool>> submitPanCardDetails(
    Map<String, String> data,
    Map<String, dynamic> images,
  );
  Future<Either<Failure, bool>> submitVehiclePermitDetails(
    Map<String, String> data,
    Map<String, dynamic> images,
  );
  Future<Either<Failure, bool>> submitFitnessDetails(
    Map<String, String> data,
    Map<String, dynamic> images,
  );
  Future<Either<Failure, bool>> submitVehicleAuditDetails(
    Map<String, String> data,
    Map<String, dynamic> images,
  );
  Future<Either<Failure, bool>> submitPollutionCertificateDetails(
    Map<String, String> data,
    Map<String, dynamic> images,
  );
  Future<Either<Failure, bool>> submitVehicleInsuranceDetails(
    Map<String, String> data,
    Map<String, dynamic> images,
  );
  Future<Either<Failure, bool>> submitIdentityDetails(
    Map<String, String> data,
  ); Future<Either<Failure, bool>> submitAllDetails(
    Map<String, String> data,
  );
}
