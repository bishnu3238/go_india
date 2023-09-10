 import 'package:flutter/material.dart';

import '../../utility/utility/utility.dart';

class Notifier {
  errorMessage({required BuildContext context, required String message}) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: kError,
            duration: oneSecond,
          ),
        );
  successMessage({required BuildContext context, required String message}) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: kSuccess,
            duration: oneSecond,
          ),
        );
  infoMessage({required BuildContext context, required String message}) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: kDark.withOpacity(0.5),
            duration: oneSecond,
          ),
        );
}
