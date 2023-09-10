import 'package:flutter/material.dart';
 import '../../../../../screens/common/common.dart';

 import '../../../../package/package.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleAppBar(
       title: AppBarLogo(),
      centerTitle: false,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
