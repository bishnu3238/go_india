import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/routes/route_path.dart';
import '../../../utility/utility/utility.dart';
import '../export.dart';

class ProfileSettingsBody extends StatelessWidget {
  const ProfileSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileSettingsCubit>();
    return BlocBuilder<ProfileSettingsCubit, ProfileSettingsState>(
        builder: (context, state) {
      return ListView(
        children: [
          const SizedBox(height: 20),
          HeadLine(
            headline: cubit.driverStore.state.name,
            style:
                gideonRoman(weight: fwb, size: getScreenWidth(kLayoutWidth * 1 / 17)),
          ),
          const SizedBox(height: 30),
          Tiles(
            title: 'View your profile',
            icon: FontAwesomeIcons.user,
            onTap: () => context.push(Screen.userProfile.path),
          ),
          Tiles(
            onTap: () =>  context.push(Screen.setLanguage.path),
            icon: FontAwesomeIcons.language,
            title: 'Set Language',
          ),
          Tiles(
            onTap: () =>  context.push(Screen.setPreferences.path),
            icon: FontAwesomeIcons.gears,
            title: 'Set Preferences',
          ),
          Tiles(
            onTap: () => context.push(Screen.support.path),
            icon: FontAwesomeIcons.servicestack,
            title: 'Support',
          ),
        ],
      );
    });
  }
}

class Tiles extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final IconData? icon;
  final Widget? trailing;

  const Tiles({super.key, this.onTap, this.icon, this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: edgeInsets0510,
        child: ListTile(
          dense: true,
          onTap: onTap,
          leading: FaIcon(
            icon,
            color: Theme.of(context).colorScheme.scrim,
          ),
          title: Text(
            title!,
            style: gideonRoman(weight: fw6, size: 16),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
