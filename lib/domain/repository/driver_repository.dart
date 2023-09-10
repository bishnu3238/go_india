import 'package:dartz/dartz.dart';
import 'package:go_india/domain/entity/entity.dart';

import '../failure/failure.dart';

abstract class DriverRepository {
  Future<Either<Failure, Driver>> updateDriver(Map<String, String> data);
  Future<Either<Failure, Driver>> getDriver(String id);
  Future<Either<Failure, Driver>> newDriver(Map<String, String> data);
  Future<Either<Failure, Driver>> logInDriver(Map<String, String> data);
  Future<Either<Failure, bool>> checkPhoneNo(Map<String, String> data);

}
