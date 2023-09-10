class PollutionInfo {
  final String  pollutionCtfImage;

  const PollutionInfo({
     required this.pollutionCtfImage,
  });

  static const PollutionInfo empty = PollutionInfo(
     pollutionCtfImage: 'accountNo',
  );

  @override
  String toString() {
    return 'PollutionInfo{   pollutionCtfImage: $pollutionCtfImage, ';
  }

  PollutionInfo copyWith({
     String? pollutionCtfImage,
  }) {
    return PollutionInfo(
       pollutionCtfImage: pollutionCtfImage ?? this.pollutionCtfImage,
    );
  }

  Map<String, String> toMap() {
    return {
       'pollutionCtfImage': pollutionCtfImage,
    };
  }
}
