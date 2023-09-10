import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../utility/utility.dart';

import '../../firebase_options.dart';

Future initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hydrated.instance.initialize();
  Bloc.observer = AppBlocObserver();
  GetItRegisterSingleton.instance.init();
}
