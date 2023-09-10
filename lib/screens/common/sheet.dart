import 'package:flutter/material.dart';

Future showSheet<T>(
    {required BuildContext context,
    VoidCallback? onClosing,
    required Widget  Function(BuildContext) widget,
    bool showHandle = false}) async {
  return showModalBottomSheet<T>(
    context: context,
    showDragHandle: showHandle,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20), right: Radius.circular(20))),
    builder: widget,
  );
}
