

class PanInfo {
  final String panNo, panImage ;

  const PanInfo({
    required this.panNo,
    required this.panImage,

  });

  static const PanInfo empty = PanInfo(
      panNo: 'bankName',
      panImage: 'accountNo',

  );

  @override
  String toString() {
    return 'BankInfo{ bankName: $panNo, accountNo: $panImage, ';
  }

  PanInfo copyWith({
    String? panNo,
    String? panImage,

  }) {
    return PanInfo(
      panNo: panNo ?? this.panNo,
      panImage: panImage ?? this.panImage,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'panNo': panNo,
      'panImage': panImage,
    };
  }

  factory PanInfo.fromMap(Map<String, dynamic> map) {
    return PanInfo(
      panNo: map['panNo'] as String,
      panImage: map['panImage'] as String,
    );
  }
}
