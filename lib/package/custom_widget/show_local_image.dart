import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowLocalImage extends StatelessWidget {
  const ShowLocalImage({
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
    return Image.asset(
      imageUrl,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
class ShowFileImage extends StatelessWidget {
  const ShowFileImage({
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
    return Image.file(
      File(imageUrl),
      fit: fit,
      width: width,
      height: height,
    );
  }
}
class ShowMemoryImage extends StatelessWidget {
  const ShowMemoryImage({
    super.key,
    required this.imageBytes,
    required this.fit,
    required this.width,
    required this.height,
  });

  final  Uint8List imageBytes;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      imageBytes,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
