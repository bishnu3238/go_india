 import 'package:flutter/material.dart';

import '../../utility/utility/utility.dart';

class PageIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;

  const PageIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.dotSize = 8,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGrey.withOpacity(0.3),
        border: Border.all(color: kGrey3),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          itemCount,
          (index) {
            bool isActive = index == currentIndex;
            return Container(
              width: dotSize,
              height: dotSize,
              margin: EdgeInsets.all(spacing / 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? activeColor : inactiveColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
