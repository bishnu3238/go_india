import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class LoadingSpinner extends StatelessWidget {
  final Color? color;
  final double size;
  const LoadingSpinner({Key? key, this.color, this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? Theme.of(context).colorScheme.onPrimary;
    return Center(
      child: waveDots(color, size),
    );
  }
}

Widget inkDrop(Color color, double size) =>
    LoadingAnimationWidget.inkDrop(color: color, size: size);
Widget waveDots(Color color, double size) =>
    LoadingAnimationWidget.waveDots(color: color, size: size);
