import 'package:flutter/material.dart';

import '../../utility/utility/utility.dart';
import '../package/package.dart';

class CardGridViewBuilder<T> extends StatelessWidget {
  const CardGridViewBuilder({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    this.crossAxisPadding = p10,
    this.mainAxisPadding = p10,
    required this.children,
    required this.builder,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisPadding;
  final double mainAxisPadding;
  final List<GridViewModel> children;
  final IndexedWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: children.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisPadding,
        mainAxisSpacing: mainAxisPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: builder

    );
  }
}
