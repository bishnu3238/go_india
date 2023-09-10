

class IdentityDetailsInfo {
  final String currentLocalAddress;
  final bool isVehicleOwner, isVehicleOlderThenYear;

  const IdentityDetailsInfo({
    required this.currentLocalAddress,
    required this.isVehicleOwner,
    required this.isVehicleOlderThenYear,
  });

  static const IdentityDetailsInfo empty = IdentityDetailsInfo(
    currentLocalAddress: 'Aadhaar',
    isVehicleOwner: false,
    isVehicleOlderThenYear: false,
  );

  @override
  String toString() {
    return 'BankInfo{ bankName: $isVehicleOwner, accountNo: $isVehicleOlderThenYear, ';
  }

  IdentityDetailsInfo copyWith({
    String? currentLocalAddress,
    bool? isVehicleOwner,
    bool? isVehicleOlderThenYear,
  }) {
    return IdentityDetailsInfo(
      currentLocalAddress: currentLocalAddress ?? this.currentLocalAddress,
      isVehicleOwner: isVehicleOwner ?? this.isVehicleOwner,
      isVehicleOlderThenYear:
          isVehicleOlderThenYear ?? this.isVehicleOlderThenYear,
    );
  }

  Map<String, String> toMap() {
    return {
      'current_local_address': currentLocalAddress.toString(),
      'is_vehicle_owner': isVehicleOwner.toString(),
      'is_vehicle_older_then_year': isVehicleOlderThenYear.toString(),
    };
  }
}
