import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_india/screens/profile_settings/export.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../../../../../package/package/package.dart';

class SetPreferencesBody extends StatelessWidget {
  const SetPreferencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: BlocConsumer<SetPreferencesCubit, SetPreferencesState>(
          builder: (context, state) {
            var cubit = context.read<SetPreferencesCubit>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTextButton(
                    text: 'Communication Preferences',
                    style: gideonRoman(weight: fw9, size: 20)),
                const SizedBox(height: 20),
                AutoSizeText(
                  'Get alerts on latest offers, promotions and benefits  from GoIndia.',
                  style: inter(),
                  maxLines: 2,
                ),
                const SizedBox(height: 25),
                CardHeadingListTile(
                  elevation: 2,
                  title: Text(
                    "Email",
                    style: inter(weight: fw5, size: 15),
                  ),
                  leading: const FaIcon(FontAwesomeIcons.envelope),
                  trailing: Switch(
                      value: state.isEmailOn,
                      onChanged: cubit.onEmailNotification),
                ),
                CardHeadingListTile(
                  elevation: 2,
                  title: Text(
                    "SMS and Phone",
                    style: inter(weight: fw5, size: 15),
                  ),
                  leading: const FaIcon(FontAwesomeIcons.commentSms),
                  trailing: Switch(
                      value: state.isSMSPhoneOn,
                      onChanged: cubit.onSMSNotification),
                ),
                CardHeadingListTile(
                  elevation: 2,
                  title: Text(
                    "Notification",
                    style: inter(weight: fw5, size: 15),
                  ),
                  leading: const FaIcon(FontAwesomeIcons.bell),
                  trailing: Switch(
                      value: state.isNotificationOn,
                      onChanged: cubit.onNotification),
                ),
              ],
            );
          },
          listener: (BuildContext context, state) {},
        ),
      ),
    );
  }
}
