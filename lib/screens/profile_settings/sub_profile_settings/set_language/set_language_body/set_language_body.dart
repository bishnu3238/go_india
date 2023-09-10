import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_india/package/custom_widget/custom_widgets.dart';
import 'package:go_india/screens/profile_settings/export.dart';
import 'package:go_india/utility/utility/utility.dart';

class SetLanguageBody extends StatelessWidget {
  const SetLanguageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
          padding: edgeInsets10,
          child: ListView(
            children: [
              const SizedBox(height: 50),
              AutoSizeText('Select your preferred language',
                  style: gideonRoman(
                      weight: fw7, color: theme.colorScheme.scrim, size: 18)),
              const SizedBox(height: 10),
              AutoSizeText("You will use the same language throughout the app",
                  style: gideonRoman()),
              const Divider(),
              const SizedBox(height: 50),
              Text("Languages:",
                  style: gideonRoman(decoration: TextDecoration.underline)),
              const SizedBox(height: 30),
              ...language
                  .map(
                    (e) => CardHeadingListTile(
                      leading: const FaIcon(FontAwesomeIcons.flag),
                      title: Text(e.lang),
                      trailing: const FaIcon(FontAwesomeIcons.check),
                     ),
                  )
                  .toList(),
            ],
          )),
    );
  }
}
