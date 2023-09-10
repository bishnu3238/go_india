import 'package:dartz/dartz.dart';

abstract class CityRepository{

  Future<Either<Exception, bool>> fetchCities();
}