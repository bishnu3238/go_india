import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../utility/utility/utility.dart';

class ShowNetImage extends StatelessWidget {
  const ShowNetImage({
    super.key,
    required this.imageUrl,
    required this.fit,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (ctx, img) => Image.asset(placeHolder),
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorWidget: (ctx, obj, trash) {
        return Image.asset(
          placeHolder,
          fit: BoxFit.cover,
          width: width,
          height: height,
        );
      },
    );
  }
}
