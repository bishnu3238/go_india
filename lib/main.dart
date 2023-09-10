import 'package:flutter/material.dart';
import 'routes/route_path.dart';
import 'screens/go_india/go_india.dart';
import 'utility/functions/init_app.dart';

// "Gradle project sync failed, basic functionality (e.g editing, debugging) will not work properly" => Try Again, Open 'Build' View, Show log in explorer;

String initialPage = Screen.profileSettings.path;

void main() async {
  await initApp();
  runApp(const GoIndia());
}
