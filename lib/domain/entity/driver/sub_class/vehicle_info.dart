class VehicleInfo {
  final String vehicleTypeId, vehicleNo, currentLocalAddress;
  final bool isVehicleOwner, isVehicleOlderThenYear, hasVehiclePermit;
  final String? rcImage,
      pollutionImage,
      insuranceImage,
      vehiclePermit,
      vehicleFontImage,
      vehicleBackImage;

  static const VehicleInfo empty = VehicleInfo(
      vehicleTypeId: '1',
      vehicleNo: 'vehicleNo',
      currentLocalAddress: 'currentLocalAddress',
      isVehicleOwner: false,
      isVehicleOlderThenYear: false,
      hasVehiclePermit: false);

  const VehicleInfo({
    required this.vehicleTypeId,
    required this.vehicleNo,
    required this.currentLocalAddress,
    required this.isVehicleOwner,
    required this.isVehicleOlderThenYear,
    required this.hasVehiclePermit,
    this.rcImage,
    this.pollutionImage,
    this.insuranceImage,
    this.vehiclePermit,
    this.vehicleFontImage,
    this.vehicleBackImage,
  });


  VehicleInfo copyWith({
    String? vehicleTypeId,
    String? vehicleNo,
    String? currentLocalAddress,
    bool? isVehicleOwner,
    bool? isVehicleOlderThenYear,
    bool? hasVehiclePermit,
    String? rcImage,
    String? pollutionImage,
    String? insuranceImage,
    String? vehiclePermit,
    String? vehicleFontImage,
    String? vehicleBackImage,
  }) {
    return VehicleInfo(
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      vehicleNo: vehicleNo ?? this.vehicleNo,
      currentLocalAddress: currentLocalAddress ?? this.currentLocalAddress,
      isVehicleOwner: isVehicleOwner ?? this.isVehicleOwner,
      isVehicleOlderThenYear:
          isVehicleOlderThenYear ?? this.isVehicleOlderThenYear,
      hasVehiclePermit: hasVehiclePermit ?? this.hasVehiclePermit,
      rcImage: rcImage ?? this.rcImage,
      pollutionImage: pollutionImage ?? this.pollutionImage,
      insuranceImage: insuranceImage ?? this.insuranceImage,
      vehiclePermit: vehiclePermit ?? this.vehiclePermit,
      vehicleFontImage: vehicleFontImage ?? this.vehicleFontImage,
      vehicleBackImage: vehicleBackImage ?? this.vehicleBackImage,
    );
  }

  @override
  String toString() {
    return 'VehicleInfo{vehicleTypeId: $vehicleTypeId, vehicleNo: $vehicleNo, currentLocalAddress: $currentLocalAddress, isVehicleOwner: $isVehicleOwner, isVehicleOlderThenYear: $isVehicleOlderThenYear, hasVehiclePermit: $hasVehiclePermit, rcImage: $rcImage, pollutionImage: $pollutionImage, insuranceImage: $insuranceImage, vehiclePermit: $vehiclePermit, vehicleFontImage: $vehicleFontImage, vehicleBackImage: $vehicleBackImage}';
  }

  Map<String, dynamic> toMap() {
    return {
      'vehicleTypeId': vehicleTypeId,
      'vehicleNo': vehicleNo,
      'currentLocalAddress': currentLocalAddress,
      'isVehicleOwner': isVehicleOwner,
      'isVehicleOlderThenYear': isVehicleOlderThenYear,
      'hasVehiclePermit': hasVehiclePermit,
      'rcImage': rcImage,
      'pollutionImage': pollutionImage,
      'insuranceImage': insuranceImage,
      'vehiclePermit': vehiclePermit,
      'vehicleFontImage': vehicleFontImage,
      'vehicleBackImage': vehicleBackImage,
    };
  }

  factory VehicleInfo.fromMap(Map<String, dynamic> map) {
    return VehicleInfo(
      vehicleTypeId: map['vehicleTypeId'] as String  ? ?? '',
      vehicleNo: map['vehicleNo'] as String  ? ?? '',
      currentLocalAddress: map['currentLocalAddress'] as String  ? ?? '',
      isVehicleOwner: map['isVehicleOwner'] as bool ? ?? false,
      isVehicleOlderThenYear: map['isVehicleOlderThenYear'] as bool ? ?? false,
      hasVehiclePermit: map['hasVehiclePermit'] as bool ? ?? false,
      rcImage: map['rcImage'] as String  ? ?? '',
      pollutionImage: map['pollutionImage'] as String  ? ?? '',
      insuranceImage: map['insuranceImage'] as String  ? ?? '',
      vehiclePermit: map['vehiclePermit'] as String  ? ?? '',
      vehicleFontImage: map['vehicleFontImage'] as String  ? ?? '',
      vehicleBackImage: map['vehicleBackImage'] as String  ? ?? '',
    );
  }
}
