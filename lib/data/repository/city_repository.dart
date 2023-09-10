import 'package:dartz/dartz.dart';
import '../../data/model/model.dart';
import '../../domain/store/store.dart';
import '../../domain/entity/entity.dart';
import '../../utility/utility/utility.dart';
import '../../package/package/package.dart';
import '../../domain/repository/repository.dart';

class GoCityRepository implements CityRepository {
  final NetworkService _networkService;
  final CityStore _cityStore;
  GoCityRepository(this._networkService, this._cityStore);

  @override
  Future<Either<Exception, bool>> fetchCities() async {
    return await _networkService.get(fetchCityApi).then(
          (value) => value.fold(
            (l) {
              List<Cities> cities =
                  mockCities.map<Cities>((e) => e.toDomain()).toList();
              _cityStore.setCities(cities);
              return left(Exception(l.error));
            },
            (r) {
              List citiesList = r['cities'] as List;
              List<Cities> cities = citiesList
                  .map<Cities>((e) => CitiesJson.fromMap(e).toDomain())
                  .toList();
              _cityStore.setCities(cities);
              return right(true);
            },
          ),
        );
  }
}
