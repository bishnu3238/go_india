import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
 import 'package:url_launcher/url_launcher.dart';

import '../../../../package/package/package.dart';
import 'export.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit(this.notifier) : super(SupportState());

  final Notifier notifier;

  Future<void> sendEmail(BuildContext context) async {
    final ctx = context;
    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'joybhakatjoy123@gmail.com',
        query: _encodeQueryParameters(<String, String>{
          'subject': 'Support!',
        }),
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        if (ctx.mounted) {
          notifier.errorMessage(
              context: ctx, message: 'could not launch email');
        }
        throw 'Could not launch email';
      }
    } catch (e) {
      notifier.errorMessage(context: ctx, message: '$e');
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
