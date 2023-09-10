import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utility/utility/utility.dart';

class SecondaryTextField extends StatelessWidget {
  const SecondaryTextField({
    super.key,
    required this.hint,
    this.onTap,
    this.trailing,
    this.errorText,
    this.icon,
    this.onIconTap,
  });

  final String hint;
  final IconData? icon;
  final String? errorText;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onIconTap;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: edgeInsets1015,
            decoration: BoxDecoration(
                color: color.surfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(5),
                border: Border.all()),
            child: Row(
              children: [
                Text(
                  hint,
                  style: gideonRoman(),
                ),
                const Spacer(),
                icon == null
                    ? const SizedBox()
                    : InkWell(
                  onTap: onIconTap,
                      child: FaIcon(
                          icon,
                          color: color.primaryContainer,
                          size: 15,
                        ),
                    )
              ],
            ),
          ),
          errorText == null
              ? const SizedBox()
              : Padding(
                  padding: edgeInsetsT5,
                  child: Text(
                    errorText!,
                    style: TextStyle(color: color.error),
                  ),
                )
        ],
      ),
    );
  }
}
