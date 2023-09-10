import 'package:dartz/dartz.dart';
import 'package:go_india/domain/failure/failure.dart';
import 'package:go_india/package/common/common.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:image_picker/image_picker.dart';

Future<Either<Failure, List<XFile?>>> openCamera() async {
  try {
    var data = await picker.pickImage(source: ImageSource.camera);
    if (data == null) return right([]);
    return right([data]);
  } catch (e) {
    return left(Failure(e.toString()));
  }
}

Future<Either<Failure, List<XFile?>>> openGalleryMulti() async {
  try {
    var data = await picker.pickMultiImage();
    return right(data);
  } catch (e) {
    return left(Failure(e.toString()));
  }
}

Future<Either<Failure, List<XFile?>>> openGallery() async {
  try {
    var data = await picker.pickImage(source: ImageSource.gallery);
    if (data == null) return left(Failure('user cancel'));
    data.path.log();
    return right([data]);
  } catch (e) {
    e.log();
    return left(Failure(e.toString()));
  }
}

Future<Either<Failure, List<XFile?>>> openMedia() async {
  try {
    var data = await picker.pickMedia();
    if (data == null) return right([]);
    return right([data]);
  } catch (e) {
    return left(Failure(e.toString()));
  }
}

Future<Either<Failure, List<XFile?>>> openMultiMedia() async {
  try {
    var data = await picker.pickMultipleMedia();
    return right(data);
  } catch (e) {
    return left(Failure(e.toString()));
  }
}
