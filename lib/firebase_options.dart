// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAEgSSCmSpZZ9eYA9b8g9o2-Bh_3dNEvTA',
    appId: '1:762867458346:web:386b5e51391d9982d9be53',
    messagingSenderId: '762867458346',
    projectId: 'go-india-aa686',
    authDomain: 'go-india-aa686.firebaseapp.com',
    storageBucket: 'go-india-aa686.appspot.com',
    measurementId: 'G-M7FSFMCZG1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhoU0ghvkOD36e_a2ZP6IpxVCNfRryWeY',
    appId: '1:762867458346:android:6d009c2b6956f664d9be53',
    messagingSenderId: '762867458346',
    projectId: 'go-india-aa686',
    storageBucket: 'go-india-aa686.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRSu4iacYH4BCTbXDDQlLeNJ8rGyneScA',
    appId: '1:762867458346:ios:ddc8040dec758f15d9be53',
    messagingSenderId: '762867458346',
    projectId: 'go-india-aa686',
    storageBucket: 'go-india-aa686.appspot.com',
    iosBundleId: 'com.goindia.goIndia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRSu4iacYH4BCTbXDDQlLeNJ8rGyneScA',
    appId: '1:762867458346:ios:ba2b4199fb2984f1d9be53',
    messagingSenderId: '762867458346',
    projectId: 'go-india-aa686',
    storageBucket: 'go-india-aa686.appspot.com',
    iosBundleId: 'com.goindia.goIndia.RunnerTests',
  );
}
