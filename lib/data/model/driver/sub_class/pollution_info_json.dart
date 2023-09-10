 import 'package:go_india/utility/utility/utility.dart';
import '../../../../domain/entity/entity.dart';

class PollutionInfoJson {
  final String pollutionCtfImage;

  const PollutionInfoJson({
    required this.pollutionCtfImage,
  });

  static const PollutionInfoJson empty = PollutionInfoJson(
    pollutionCtfImage: 'accountNo',
  );

  @override
  String toString() {
    return 'PollutionInfo{   pollutionCtfImage: $pollutionCtfImage, ';
  }

  PollutionInfoJson copyWith({
    String? pollutionCtfImage,
  }) {
    return PollutionInfoJson(
      pollutionCtfImage: pollutionCtfImage ?? this.pollutionCtfImage,
    );
  }

  Map<String, String> toMap() {
    return {
      'pollutionCtfImage': pollutionCtfImage,
    };
  }

  factory PollutionInfoJson.fromMap(Map<String, dynamic> json) =>
      PollutionInfoJson(
        pollutionCtfImage: json['pollution_photo'] as String? ?? placeHolder,
      );

 PollutionInfo  toDomain() =>PollutionInfo(pollutionCtfImage: pollutionCtfImage);
}
