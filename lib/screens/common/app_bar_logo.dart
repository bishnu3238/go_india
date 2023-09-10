import 'package:flutter/material.dart';

import '../../package/package/package.dart';
import '../../utility/utility/utility.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageShower(
      imageUrl: appBarLogo,
      imgType: ImgType.local,
      width: getScreenWidth(kLayoutWidth * 1 / 6),
    );
  }
}
