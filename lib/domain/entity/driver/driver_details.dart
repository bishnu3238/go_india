import '../entity.dart';

class DriverDetails {
  final String city, cityId, driverId;
  final BankInfo bankInfo;
  final DrivingLicenseInfo drivingLicenseInfo;
  final AadhaarInfo aadhaarInfo;
  final PanInfo panInfo;
  final FitnessInfo fitnessInfo;

  const DriverDetails({
    required this.city,
    required this.cityId,
    required this.driverId,
    this.bankInfo = BankInfo.empty,
    this.panInfo = PanInfo.empty,
    this.fitnessInfo = FitnessInfo.empty,
    this.aadhaarInfo = AadhaarInfo.empty,
    this.drivingLicenseInfo = DrivingLicenseInfo.empty,
  });

  static const DriverDetails empty =
      DriverDetails(city: 'City', cityId: '1', driverId: '0');

  @override
  String toString() =>
      'DriverDetails{city: $city, cityId: $cityId, driverId: $driverId, bankInfo: $bankInfo, drivingLicenseInfo: $drivingLicenseInfo, aadhaarInfo: $aadhaarInfo, panInfo: $panInfo, fitnessInfo: $fitnessInfo}';

  DriverDetails copyWith({
    String? city,
    String? cityId,
    String? driverId,
    PanInfo? panInfo,
    BankInfo? bankInfo,
    AadhaarInfo? aadhaarInfo,
    FitnessInfo? fitnessInfo,
    DrivingLicenseInfo? drivingLicenseInfo,
  }) {
    return DriverDetails(
      city: city ?? this.city,
      cityId: cityId ?? this.cityId,
      panInfo: panInfo ?? this.panInfo,
      driverId: driverId ?? this.driverId,
      bankInfo: bankInfo ?? this.bankInfo,
      aadhaarInfo: aadhaarInfo ?? this.aadhaarInfo,
      fitnessInfo: fitnessInfo ?? this.fitnessInfo,
      drivingLicenseInfo: drivingLicenseInfo ?? this.drivingLicenseInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city.toString(),
      'city_id': cityId.toString(),
      'driver_id': driverId.toString(),
      'bankInfo': bankInfo.toMap(),
      'drivingLicenseInfo': drivingLicenseInfo.toMap(),
      'aadhaarInfo': aadhaarInfo.toMap(),
      'panInfo': panInfo.toMap(),
      'fitnessInfo': fitnessInfo.toMap(),
    };
  }

  // factory DriverDetails.fromMap(Map<String, dynamic> map) {
  //   return DriverDetails(
  //     city: map['city'] as String,
  //     cityId: map['cityId'] as String,
  //     driverId: map['driverId'] as String,
  //     bankInfo: BankInfo.fromMap(map['bankInfo']),
  //     drivingLicenseInfo: DrivingLicenseInfo.fromMap(map['drivingLicenseInfo']),
  //     aadhaarInfo: AadhaarInfo.fromMap(map['aadhaarInfo']),
  //     panInfo: PanInfo.fromMap(map['panInfo']),
  //     fitnessInfo: FitnessInfo.fromMap(map['fitnessInfo']),
  //   );
  // }
}
