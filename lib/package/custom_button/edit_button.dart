import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../utility/constant/constant.dart';

class EditButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? label;
  final IconData? icon;
  final MainAxisSize minSize;
  final MainAxisAlignment mainAxis;
  const EditButton(
      {super.key,
      this.onTap,
      this.label,
      this.icon,
        this.minSize = MainAxisSize.min,
      this.mainAxis = MainAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets5,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: mainAxis,
          mainAxisSize: minSize,
          children: [
            icon == null
                ? const SizedBox()
                : Icon(icon, color: kError, size: 15),
            const SizedBox(width: 5),
            AutoSizeText(
              label ?? "",
              style: gQuan(color: kError),
            ),
          ],
        ),
      ),
    );
  }
}
