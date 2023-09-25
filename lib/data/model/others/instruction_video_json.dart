import 'package:go_india/domain/entity/others/others.dart';
import 'package:go_india/package/common/common.dart';
import 'package:go_india/utility/utility/utility.dart';

class InstroVideoJson {
  final String id, video, date;

  const InstroVideoJson({
    required this.id,
    required this.video,
    required this.date,
  });

  factory InstroVideoJson.fromMap(Map<String, dynamic> map) {
    return InstroVideoJson(
      id: map['id'] as String? ?? '',
      video: map['video'] as String? ?? '',
      date: map['date'] as String? ?? DateTime.now().toString(),
    );
  }

  InstroVideo toDomain() => InstroVideo(
        id: id,
        video: '$instructionVideoFld/$video',
        date: date.stringToDate,
      );
}
