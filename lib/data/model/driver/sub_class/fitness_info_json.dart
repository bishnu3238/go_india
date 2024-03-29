import '../../../../utility/utility/utility.dart';

import '../../../../domain/entity/entity.dart';

class FitnessInfoJson {
  final String fitnessCertificateImage;

  const FitnessInfoJson({
    required this.fitnessCertificateImage,
  });

  factory FitnessInfoJson.fromMap(Map<String, dynamic> json) {
    return FitnessInfoJson(
      fitnessCertificateImage:
          json['fitnessCertificateImage'] as String? ?? placeHolder,
    );
  }

  FitnessInfo toDomain() =>
      FitnessInfo(fitnessCertificateImage: fitnessCertificateImage);
}
