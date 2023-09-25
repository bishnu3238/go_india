 import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';

import '../../package/package/package.dart';

enum ImgType { local, network, file, memory }

class ImageShower extends StatelessWidget {
  final String imageUrl;
  final ImgType imgType;
  final double borderRadius;
  final BoxFit fit;
  final double? width;
  final double? height;

  const ImageShower({
    super.key,
    required this.imageUrl,
    this.imgType = ImgType.network,
    this.borderRadius = 10,
    this.fit = BoxFit.fill,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: imgType == ImgType.local
          ? ShowLocalImage(
              imageUrl: imageUrl, fit: fit, width: width, height: height)
          : imgType == ImgType.network
              ? ShowNetImage(
                  imageUrl: imageUrl, fit: fit, width: width, height: height)
              : ShowFileImage(
                  imageUrl: imageUrl, fit: fit, width: width, height: height),
    );
  }
}


