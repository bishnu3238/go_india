import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/custom_button/custom_button.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/screens/profile_settings/sub_profile_settings/support/export.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:go_router/go_router.dart';

class SupportBody extends StatelessWidget {
  const SupportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Card(
          shape: roundBorder12,
          child: Padding(
            padding: edgeInsets16,
            child: Column(
              children: [
                const Icon(Icons.email),
                const SizedBox(height: 20),
                AutoSizeText(
                  'Do you have any queries?',
                  style: gideonRoman(size: 18),
                ),
                const SizedBox(height: 20),
                Text('Please write to us at', style: gideonRoman()),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    BlocProvider.of<SupportCubit>(context).sendEmail(context);
                  },
                  child: Text(
                    supportEmail,
                    style: gQuan(color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
                const SizedBox(height: 5),
                Text('for  any assistance.', style: gideonRoman()),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50),
        ElButton(
            text: 'Back', padding: edgeInsets10, onTap: () => context.pop()),
      ],
    );
  }
}
