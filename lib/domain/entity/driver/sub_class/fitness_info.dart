class FitnessInfo {
  final String fitnessCertificateImage;

  const FitnessInfo({
    required this.fitnessCertificateImage,
  });

  static const FitnessInfo empty = FitnessInfo(
    fitnessCertificateImage: 'accountNo',
  );

  @override
  String toString() {
    return 'BankInfo{  accountNo: $fitnessCertificateImage, ';
  }

  FitnessInfo copyWith({
    String? fitnessCertificateImage,
  }) {
    return FitnessInfo(
      fitnessCertificateImage:
          fitnessCertificateImage ?? this.fitnessCertificateImage,
    );
  }

  Map<String, String> toMap() => {
        'fitness_certificate': fitnessCertificateImage,
      };

  factory FitnessInfo.fromMap(Map<String, dynamic> map) {
    return FitnessInfo(
      fitnessCertificateImage: map['fitness_certificate'] as String? ?? '',
    );
  }
}
