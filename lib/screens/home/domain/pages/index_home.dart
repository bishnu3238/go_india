import 'package:flutter/material.dart';

import '../../../../package/package/package.dart';
import '../../../../utility/utility/utility.dart';

class IndexHome extends StatelessWidget {
  const IndexHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: ImageShower(
            imageUrl: gMap,
            fit: BoxFit.fill,
            imgType: ImgType.local,
          ),
        ),
      ],
    );
  }
}
