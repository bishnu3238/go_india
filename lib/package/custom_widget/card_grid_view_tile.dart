import 'package:flutter/material.dart';

import '../package/package.dart';
import '../../utility/utility/utility.dart';

class CardGridViewTile<T> extends StatelessWidget {
  final GridViewModel info;
  const CardGridViewTile({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets5,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: edgeInsets5,
          child: InkWell(
            onTap: () {},
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ImageShower(
                  fit: BoxFit.fitHeight,
                  height: getScreenHeight(130),
                  width: double.maxFinite,
                  imageUrl: info.image,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(info.title),
                    Text(info.subTitle),
                    const Spacer(),
                    Text('$rs ${info.price}')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridViewModel {
  String id;
  String title;
  String subTitle;
  String price;
  String image;

  String status;

//<editor-fold desc="Data Methods">
  GridViewModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.image,
    required this.status,
  });

  GridViewModel copyWith({
    String? id,
    String? title,
    String? price,
    String? subTitle,
    String? image,
    String? status,
  }) {
    return GridViewModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      price: price ?? this.price,
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'image': image,
      'status': status,
    };
  }
}
