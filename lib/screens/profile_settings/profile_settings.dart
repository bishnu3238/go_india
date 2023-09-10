import 'package:flutter/material.dart';
import 'package:go_india/package/custom_widget/simple_app_bar.dart';
import 'package:go_india/screens/common/app_bar_logo.dart';
import 'export.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SimpleAppBar(
          centerTitle: false,
          title: AppBarLogo()),
      body: ProfileSettingsBody(),
    );
  }
}
