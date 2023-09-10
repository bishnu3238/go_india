import 'package:flutter/material.dart';

import '../../package/package/package.dart';
import '../../utility/utility/utility.dart';

class ContainerImageShow extends StatelessWidget {
  const ContainerImageShow({super.key, required this.image, required this.imgType});

  final String image;
  final ImgType imgType;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: edgeInsets10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.splashColor.withOpacity(0.1),
      ),
      child: Align(
        alignment: Alignment.center,
        child: ImageShower(
          imageUrl: image,
          imgType: imgType,
        ),
      ),
    );
  }
}
