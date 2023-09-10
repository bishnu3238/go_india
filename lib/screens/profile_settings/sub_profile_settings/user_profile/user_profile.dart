import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'export.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => UserProfileCubit(getIt()),
      child: Scaffold(
        appBar: _simpleAppBar(context),
        body: const UserProfileBody(),
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(
    bgColor: theme.cardColor,
    leading: FavIcon(
      icon: Icons.arrow_back,
      onTap: () => context.push(Screen.waitForVerification.path),
      iconColor: theme.shadowColor,
    ),
    centerTitle: false,
    label: Screen.userProfile.toTitle,
    buttons: [
      EditButton(
        icon: FontAwesomeIcons.penToSquare,
        label: 'Edit',
        onTap: () => context.pushNamed(editProfileName),
      )
    ],
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw9),
  );
}
