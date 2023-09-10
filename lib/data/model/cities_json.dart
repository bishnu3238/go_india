import 'package:go_india/domain/entity/entity.dart';

class CitiesJson {
  final String id, cityName, status;

  const CitiesJson({
    required this.id,
    required this.cityName,
    required this.status,
  });

  factory CitiesJson.fromMap(Map<String, dynamic> json) {
    return CitiesJson(
      id: json['id'].toString(),
      cityName: json['city_name'].toString(),
      status: json['status'].toString(),
    );
  }

  Cities toDomain() => Cities(
        id: id,
        cityName: cityName,
        status: int.tryParse(status) ?? 0,
      );
}

List<CitiesJson> mockCities = [
  const CitiesJson(id: '1', cityName: 'Kolkata', status: '1'),
  const CitiesJson(id: '2', cityName: 'Sealdah', status: '1'),
  const CitiesJson(id: '3', cityName: 'Howrah', status: '1'),
  const CitiesJson(id: '4', cityName: 'Mumbai', status: '1'),
  const CitiesJson(id: '5', cityName: 'Bandle', status: '1'),
  const CitiesJson(id: '6', cityName: 'Durgapur', status: '1'),
  const CitiesJson(id: '7', cityName: 'Asansol', status: '1'),
];
