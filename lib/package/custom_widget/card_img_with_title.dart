import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

 import '../package/package.dart';

class CardImgWithTitle extends StatelessWidget {


  const CardImgWithTitle({super.key, required this.brand,this.onTap });

  final dynamic brand;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: getScreenWidth(150),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 15, 5),
              child: Column(
                children: [
                  SizedBox(
                    width: getScreenWidth(110),
                    height: getScreenHeight(60),
                    child: ImageShower(imageUrl: brand.image),
                  ),
                  AutoSizeText(
                    brand.brandName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    // style: stl1(14, null, FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
