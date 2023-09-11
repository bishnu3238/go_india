import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/screens/welcome/export.dart';
import 'package:go_router/go_router.dart';
import '../../../package/package/package.dart';
import '../../../utility/utility/utility.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeCubit, WelcomeState>(builder: (context, state) {
      var cubit = context.read<WelcomeCubit>();
      return Padding(
        padding: edgeInsets0520,
        child: Column(
          children: [
            HeadLine(
              headline: 'Welcome ${cubit.driverStore.state.name}',
              style: inter(
                weight: fwb,
                size: getScreenWidth(kLayoutWidth * 1 / 20),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () => context.go(addVehiclePath),
              child: HeadLine(
                headline: 'Start Application',
                style: gideonRoman(
                  weight: fw6,
                  size: getScreenWidth(kLayoutWidth * 1 / 22),
                ),
                button: const FaIcon(FontAwesomeIcons.angleRight),
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () => context.push(Screen.profileSettings.path),
              child: HeadLine(
                headline: 'Profile Settings',
                style: gideonRoman(
                  weight: fw6,
                  size: getScreenWidth(kLayoutWidth * 1 / 22),
                ),
                button: const FaIcon(FontAwesomeIcons.angleRight),
              ),
            ),
            const Divider(),
          ],
        ),
      );
    });
  }
}
