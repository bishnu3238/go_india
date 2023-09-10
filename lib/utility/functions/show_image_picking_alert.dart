import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../utility/utility.dart';
import '../../domain/failure/failure.dart';

Future<Either<Failure, List<XFile?>>> showImagePickingAlert(
    BuildContext context,
    {required String title,
    bool? multi = false}) async {
  List<XFile?> images = [];
  final imageSource = await showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return CupertinoAlertDialog(
        title: Text(
          title,
          style: gideonRoman(),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Take a picture',
              style: gideonRoman(),
            ),
            onPressed: () => Navigator.of(context).pop(ImageSource.camera),
          ),
          CupertinoDialogAction(
            child: Text(
              'Choose from gallery',
              style: gideonRoman(),
            ),
            onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
          ),
        ],
      );
    },
  );
  if (imageSource == null) {
    return left(Failure('No source available'));
  } else if (imageSource == ImageSource.camera) {
    await openCamera().then((value) => value.fold(
          (l) => left(Failure(l.message)),
          (r) => images = r,
        ));
  } else if (imageSource == ImageSource.gallery && multi!) {
    await openGalleryMulti().then((value) => value.fold(
          (l) => left(Failure(l.message)),
          (r) => images = r,
        ));
  } else {
    await openGallery().then((value) => value.fold(
          (l) => left(Failure(l.message)),
          (r) => images = r,
        ));
  }
  return right(images);
}
