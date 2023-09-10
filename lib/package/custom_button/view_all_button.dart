import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  final VoidCallback onTap;
  const ViewAllButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return   TextButton(onPressed: onTap, child: const Text("View All"));
  }
}
