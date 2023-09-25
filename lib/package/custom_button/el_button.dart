import 'package:flutter/material.dart';
import '../../utility/utility/utility.dart';
import '../custom_widget/loading_spinner.dart';

class ElButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Widget? title;
  final TextStyle? style;
  final bool showLoading;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  const ElButton(
      {super.key,
      this.title,
      this.text = '',
      this.showLoading = false,
      this.padding = edgeInsets5,
      this.bgColor,
      this.style,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            bgColor ?? Theme.of(context).colorScheme.scrim,
          ),
          shape: MaterialStatePropertyAll(roundBorder5),
          padding: const MaterialStatePropertyAll(edgeInsets0812),
        ),
        child: showLoading
            ? const LoadingSpinner(size: 20)
            : title ?? Text(text, style: style ?? gQuan()),
      ),
    );
  }
}
