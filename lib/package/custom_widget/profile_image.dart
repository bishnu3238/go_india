import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utility/utility/utility.dart';
import '../package/package.dart';

class ProfileImageCircle extends StatelessWidget {
  const ProfileImageCircle({
    super.key,
    required this.image,
    required this.imgType,
    this.elevation = 10,
    this.fit = BoxFit.cover,
    this.widget,
    this.showEdit = false,
    this.tb,
    this.tT,
    this.tR,
    this.tL,
    this.width,
    this.imgHeight,
    this.imgWidth,
    this.onTap,
  });
  final String image;
  final bool showEdit;
  final BoxFit fit;
  final ImgType imgType;
  final Widget? widget;
  final VoidCallback? onTap;
  final double? width, imgWidth, imgHeight, tR, tb, tL, tT, elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? getScreenWidth(kLayoutWidth),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: cardGradient,
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: edgeInsets5,
              child: Center(
                child: ClipOval(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: ImageShower(
                    fit: fit,
                    borderRadius: 8,
                    height: imgHeight ??
                        getScreenWidth(kLayoutWidth *
                            1 /
                            2), //200, //getScreenHeight(kLayoutHeight * 1 / 4),
                    width: imgWidth ??
                        getScreenWidth(kLayoutWidth *
                            1 /
                            2), //200 //getScreenWidth(kLayoutWidth * 1/2),
                    imageUrl: image,
                    imgType: imgType,
                  ),
                ),
              ),
            ),
            widget ?? const SizedBox(),
            showEdit
                ? Positioned(
                    right: tR ??
                        getScreenWidth(kLayoutWidth * 1 / 2) -
                            getScreenWidth(kLayoutWidth * 1 / 4),
                    bottom: tb ?? 10,
                    top: tT,
                    left: tL,
                    child: Card(
                      margin: edgeInsets,
                      elevation: elevation,
                      shape: const CircleBorder(),
                      child: const Padding(
                        padding: edgeInsets10,
                        child: FaIcon(FontAwesomeIcons.penToSquare, size: 18),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
