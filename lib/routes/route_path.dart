import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Screen {
  splash,
  login,
  home,
  error,
  onBoarding,
  startApplication,
  support,
  profileSettings,
  otp,
  welcome,
  welcomeDriverDetails,
  addVehicle,
  driverInitialDetails,
  bankAccountDetails,
  profilePicture,
  driverLicenseNo,
  drivingLicense,
  aadharCard,
  rcCertificate,
  pollutionUnderControl,
  vehicleInsurance,
  panCard,
  vehiclePermit,
  fitnessCertificate,
  vehicleAudit,
  identity,
  userProfile,
  setPreferences,
  setLanguage,
  waitForVerification,
  signUp, editProfile,
}

extension AppPageExtension on Screen {

  String get path => '/$name'; // e.g : "/splash"

  String get subPath => name;  // e.g : "splash"

  String get cName => name.toUpperCase(); // e.g : "SPLASH"

  String get capitalName {
    String enumString = toString().split('.').last;
    List<String> words =
        enumString.split(RegExp('(?=[A-Z])'));
    String result = words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
    return result;
  }

  String    nameRoute(BuildContext context) => GoRouter.of(context).namedLocation(cName);


  void go(BuildContext context)=> context.go(nameRoute(context)) ;

}
