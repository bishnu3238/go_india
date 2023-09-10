class AadhaarInfo {
  final String aadhaarNo, aadhaarImage, aadhaarImageBack;
  final int status;

  const AadhaarInfo({
    required this.aadhaarNo,
    required this.aadhaarImage,
    required this.aadhaarImageBack,
    required this.status,
  });
  static const AadhaarInfo empty = AadhaarInfo(
      aadhaarNo: '123456789898',
      aadhaarImage: 'aadhaarImage',
      aadhaarImageBack: 'aadhaarImageBack',
      status: 0);

  @override
  String toString() {
    return 'AadhaarInfo{ aadhaarNo: $aadhaarNo, aadhaarImage: $aadhaarImage, aadhaarImageBack: $aadhaarImageBack, status: $status,}';
  }

  AadhaarInfo copyWith({
    String? aadhaarNo,
    String? aadhaarImage,
    String? aadhaarImageBack,
    int? status,
  }) {
    return AadhaarInfo(
      aadhaarNo: aadhaarNo ?? this.aadhaarNo,
      aadhaarImage: aadhaarImage ?? this.aadhaarImage,
      aadhaarImageBack: aadhaarImageBack ?? this.aadhaarImageBack,
      status: status ?? this.status,
    );
  }

  Map<String, String> toMap() {
    return {
      'aadhar_number': aadhaarNo.toString(),
      'aadhar_photo': aadhaarImage.toString(),
      'aadhar_photo_back': aadhaarImageBack.toString(),
      'status': status.toString(),
    };
  }

  factory AadhaarInfo.fromMap(Map<String, dynamic> map) {
    return AadhaarInfo(
      aadhaarNo: map['aadhar_number'] as String ? ??"",
      aadhaarImage: map['aadhar_photo']  as String ? ??"",
      aadhaarImageBack: map['aadhar_photo_back']  as String ? ??"",
      status: int.tryParse(map['status'])  ?? 0,
    );
  }

//</editor-fold>
}
