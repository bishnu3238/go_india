import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/common.dart';

class PanCardState {
  PanCardState(
      {this.panCard = const PanCard.dirty(),
      this.panImage = const [],
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage = ''});

  final PanCard panCard;
  final List<XFile?> panImage;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  PanCardState copyWith({
    PanCard? panCard,
    List<XFile?>? panImage,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      PanCardState(
          panCard: panCard ?? this.panCard,
          panImage: panImage ?? this.panImage,
          status: status ?? this.status,
          isValid: isValid ?? this.isValid,
          errorMessage: errorMessage ?? this.errorMessage);
}
