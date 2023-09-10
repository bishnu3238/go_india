import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../package/package/package.dart';
import '../common/common.dart';
import 'export.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: simpleAppBar,
      body: OnboardingBody(theme: theme),
    );
  }
}

var simpleAppBar = SimpleAppBar(
  title: const AppBarLogo(),
  centerTitle: false,
  buttons: [
    FavIcon(
      icon: FontAwesomeIcons.circleQuestion,
      onTap: () {},
    )
  ],
);
