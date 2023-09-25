import 'package:go_india/domain/entity/entity.dart';
import '../../../../utility/utility/utility.dart';

class PanInfoJson {
  final String panNo, panImage;

  const PanInfoJson({
    required this.panNo,
    required this.panImage,
  });

  factory PanInfoJson.fromMap(Map<String, dynamic> json) {
    return PanInfoJson(
      panNo: json['pan_number'] as String? ?? placeHolder,
      panImage: json['pan_card'] as String? ?? placeHolder,
    );
  }

  PanInfo toDomain() => PanInfo(
        panNo: panNo,
        panImage: panImage,
      );
}
