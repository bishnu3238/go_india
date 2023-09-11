import 'package:flutter/material.dart';
import 'routes/route_path.dart';
import 'screens/go_india/go_india.dart';
import 'utility/functions/init_app.dart';


String initialPage = Screen.splash.path;

void main() async {
  await initApp();
  runApp(const GoIndia());
}
