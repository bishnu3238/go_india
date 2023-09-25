import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utility/utility.dart';

PopupMenuEntry<PopUpItem?> logoutMenu = const PopupMenuItem(
  value: PopUpItem.logout,
  child: Row(
    children: [
      Padding(
        padding: edgeInsets1505,
        child: Icon(FontAwesomeIcons.arrowRightFromBracket),
      ),
      Text("Logout"),
    ],
  ),
);
PopupMenuEntry<PopUpItem?> profileMenu = const PopupMenuItem(
  value: PopUpItem.profile,
  child: Row(
    children: [
      Padding(
        padding: edgeInsets1505,
        child: Icon(FontAwesomeIcons.user),
      ),
      Text("Profile"),
    ],
  ),
);
