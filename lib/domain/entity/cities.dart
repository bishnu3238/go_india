

class Cities {

  final String id;
  final String cityName;
  final int status;

  const Cities({
    required this.id,
    required this.cityName,
    required this.status,
  });


  @override
  String toString() {
    return 'Cities{ id: $id, cityName: $cityName, status: $status}';
  }

  Cities copyWith({
    String? id,
    String? cityName,
    int? status,
  }) {
    return Cities(
      id: id ?? this.id,
      cityName: cityName ?? this.cityName,
      status:  status?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cityName': cityName,
      'status': status,
    };
  }



}