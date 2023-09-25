 import 'package:flutter/material.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/utility/constant/border_radius.dart';
import 'package:go_india/utility/constant/constant.dart';
import 'package:go_india/utility/global/global.dart';

enum PopUpItem {
  logout, profile,
}

Future popUp(
  BuildContext context,
  List<PopupMenuEntry<PopUpItem?>> items, [
  double elevation = 8,
]) async {
  var result = await showMenu<PopUpItem?>(
    context: context,
    shape: roundBorder10,
    elevation: elevation,
    position: position(context),
    items: items,
  );
  if(context.mounted) manuResult(context, result);
  return;

  // return result == null ? left(null) : right(result);
}

manuResult(BuildContext context, PopUpItem? value) {
  switch (value) {
    case PopUpItem.logout:
      get<AuthRepository>().logOut();
    case PopUpItem.profile:
      Screen.userProfile.go(context);
    default:
      null;
  }
}

RelativeRect position(BuildContext context) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  return RelativeRect.fromRect(
    Rect.fromPoints(
      overlay.localToGlobal(overlay.size.topRight(Offset.zero),
          ancestor: overlay),
      overlay.localToGlobal(overlay.size.topRight(Offset.zero),
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );
}
