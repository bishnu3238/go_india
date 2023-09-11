import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../domain/entity/entity.dart';

class ProfilePictureState {
  ProfilePictureState({
    required this.driver,
    this.profileImage = const [],
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage = '',
  });

  final Driver driver;
  final List<XFile?> profileImage;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  ProfilePictureState copyWith({
    Driver? driver,
    final List<XFile?>? profileImage,
    final FormzSubmissionStatus? status,
    final bool? isValid,
    final String? errorMessage,
  }) =>
      ProfilePictureState(
          driver: driver ?? this.driver,
          profileImage: profileImage ?? this.profileImage,
          status: status ?? this.status,
          isValid: isValid ?? this.isValid,
          errorMessage: errorMessage ?? this.errorMessage);
}

Future<Uint8List> getImageBytes(String image) async {
  final ByteData bytes = await rootBundle.load('assets/image.jpg');
  return bytes.buffer.asUint8List();
}
