import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_india/utility/constant/text_style.dart';


class RadioButtons<T> extends StatelessWidget {
  const RadioButtons(
      {super.key,
      required this.enums,
      required this.groupValue,
      required this.onChange});
  final List enums;
  final T groupValue;
  final Function(T?) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          enums.length,
          (index) => Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal, alignment: WrapAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio<T>(
                  value: enums[index],
                  groupValue: groupValue,
                  onChanged: onChange,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
              AutoSizeText(
                enums[index].toString().split('.').last.toUpperCase(),
                maxLines: 1,
                style: gQuan(size: 8),
              ),
            ],
          ),
        ).toList(),
      ],
    );
  }
}
