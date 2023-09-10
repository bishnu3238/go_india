import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:auto_size_text/auto_size_text.dart';

 import '../../../utility/utility/utility.dart';
import '../../../package/package/package.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../export.dart';

class WaitForVerificationBody extends StatelessWidget {
  const WaitForVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: BlocBuilder<WaitForVerificationCubit, WaitForVerificationState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                AutoSizeText('Hello \n${state.driver.name}',
                    textAlign: TextAlign.start,
                    style: inter(size: getScreenWidth(kLayoutWidth * 1 / 8))),
                const SizedBox(height: 30),
                AutoSizeText(
                  'Thank you for your interest. \nWe will review your information and get back to you shortly',
                  style: inter(size: getScreenWidth(kLayoutWidth * 1 / 20)),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 50),
                ElButton(
                  text: 'Profile Settings',
                  onTap: () => context.goNamed('user-profile'),
                ),
                const Card(
                  child: Text(""),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
