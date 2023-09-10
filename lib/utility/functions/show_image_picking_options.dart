import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../domain/failure/failure.dart';
import '../../package/package/package.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:go_india/utility/utility/utility.dart';

Future<Either<Failure, List<XFile?>>> showImagePickingOptions(
    BuildContext context) async {
  return await showSheet(
    onClosing: () => unit,
    context: context,
    widget: (context) => Padding(
      padding: edgeInsets0520,
      child: Wrap(
        children: [
          Padding(
            padding: edgeInsets2025,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageTextColumn(
                  icon: FontAwesomeIcons.solidFolderOpen,
                  label: "GALLERY",
                  onTap: () async => await openGallery().then(
                    (value) => context.pop(value),
                  ),
                ),
                const SizedBox(width: 50),
                ImageTextColumn(
                  icon: FontAwesomeIcons.cameraRetro,
                  label: "CAMERA",
                  onTap: () async => await openCamera().then(
                    (value) => context.pop(value),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
