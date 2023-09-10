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
  String get path => '/$name';
  String get subPath => name;
  String get toName => name.toUpperCase();
  String get capitalName {
    String enumString = toString().split('.').last;
    List<String> words =
        enumString.split(RegExp('(?=[A-Z])')); // Split by capital letters
    String result = words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
    return result;
  }

  // String get path {
  //   switch (this) {
  //     case Screen.splash:
  //       return "/";
  //     case Screen.home:
  //       return "/home";
  //     case Screen.driverInitialDetails:
  //       return "/driverInitialDetails";
  //     case Screen.addVehicle:
  //       return "/addVehicle";
  //     case Screen.profileSettings:
  //       return "/profileSettings";
  //     case Screen.support:
  //       return "/support";
  //     case Screen.login:
  //       return "/login";
  //     case Screen.startApplication:
  //       return "/startApplication";
  //     case Screen.error:
  //       return "/error";
  //     case Screen.onBoarding:
  //       return "/start";
  //     case Screen.welcome:
  //       return "/welcome";
  //     case Screen.welcomeDriverDetails:
  //       return "/welcomeDriverDetails";
  //     case Screen.otp:
  //       return "/otp";
  //     case Screen.bankAccountDetails:
  //       return "/bankAccountDetails";
  //     case Screen.profilePicture:
  //       return "/profilePicture";
  //     case Screen.driverLicenseNo:
  //       return "/driverLicenseNo";
  //     case Screen.aadharCard:
  //       return "/aadharCard";
  //     case Screen.rcCertificate:
  //       return "/rcCertificate";
  //     case Screen.pollutionUnderControl:
  //       return "/pollutionUnderControl";
  //     case Screen.vehicleInsurance:
  //       return "/vehicleInsurance";
  //     case Screen.panCard:
  //       return "/panCard";
  //     case Screen.vehiclePermit:
  //       return "/vehiclePermit";
  //     case Screen.fitnessCertificate:
  //       return "/fitnessCertificate";
  //     case Screen.vehicleAudit:
  //       return "/vehicleAudit";
  //     case Screen.identity:
  //       return "/identity";
  //     case Screen.userProfile:
  //       return "/userProfile";
  //     case Screen.setPreferences:
  //       return "/setPreferences";
  //     case Screen.setLanguage:
  //       return "/setLanguage";case Screen.waitForVerification:
  //       return "/waitForVerification";
  //
  //     default:
  //       return "/";
  //   }
  // }

  ///

  // String get toName {
  //   switch (this) {
  //     case Screen.home:
  //       return "HOME";
  //     case Screen.driverInitialDetails:
  //       return "DRIVERINITIALDETAILS";
  //     case Screen.login:
  //       return "LOGIN";
  //     case Screen.addVehicle:
  //       return "ADDVEHICLE";
  //     case Screen.support:
  //       return "SUPPORT";
  //     case Screen.splash:
  //       return "SPLASH";
  //     case Screen.profileSettings:
  //       return "PROFILESETTINGS";
  //     case Screen.error:
  //       return "ERROR";
  //     case Screen.startApplication:
  //       return "STARTAPPLICATION";
  //     case Screen.onBoarding:
  //       return "START";
  //     case Screen.welcome:
  //       return "WELCOME";
  //     case Screen.welcomeDriverDetails:
  //       return "welcomeDriverDetails";
  //     case Screen.otp:
  //       return "OTP";
  //     case Screen.bankAccountDetails:
  //       return "BankAccountDetails";
  //     case Screen.profilePicture:
  //       return "ProfilePicture";
  //     case Screen.driverLicenseNo:
  //       return "DriverLicenseNo";
  //     case Screen.aadharCard:
  //       return "AadhaarCardDetails";
  //     case Screen.rcCertificate:
  //       return "RCCertificate";
  //     case Screen.pollutionUnderControl:
  //       return "PollutionUnderControl";
  //     case Screen.vehicleInsurance:
  //       return "VehicleInsurance";
  //     case Screen.panCard:
  //       return "PanCard";
  //     case Screen.vehiclePermit:
  //       return "VehiclePermit";
  //     case Screen.fitnessCertificate:
  //       return "FitnessCertificate";
  //     case Screen.vehicleAudit:
  //       return "VehicleAudit";
  //     case Screen.identity:
  //       return "Identity";
  //     case Screen.userProfile:
  //       return "USERPROFILE";
  //     case Screen.waitForVerification:
  //       return "WaitForVerification";
  //     default:
  //       return "HOME";
  //   }
  // }

  String get toTitle {
    switch (this) {
      case Screen.home:
        return "My App";
      case Screen.driverInitialDetails:
        return "Driver Details";
      case Screen.login:
        return "My App Log In";
      case Screen.addVehicle:
        return "New Vehicle";
      case Screen.splash:
        return "My App Splash";
      case Screen.support:
        return "Support";
      case Screen.profileSettings:
        return "Profile Settings";
      case Screen.error:
        return "My App Error";
      case Screen.startApplication:
        return "Application";
      case Screen.onBoarding:
        return "Welcome to My App";
      case Screen.otp:
        return "My app OTP";
      case Screen.aadharCard:
        return "Aadhaar Card Details";
      case Screen.welcome:
        return "Welcome";
      case Screen.profilePicture:
        return "Profile Picture";
      case Screen.driverLicenseNo:
        return "Driving License Details";
      case Screen.identity:
        return "Identity Details";
      case Screen.rcCertificate:
        return "RC Certificate Details";
      case Screen.pollutionUnderControl:
        return "Pollution Details";
      case Screen.panCard:
        return "Pan Card Details";
      case Screen.vehicleAudit:
        return "Vehicle Audit Details";
      case Screen.vehicleInsurance:
        return "Vehicle Insurance Details";
      case Screen.vehiclePermit:
        return "Vehicle Permit Details";
      case Screen.fitnessCertificate:
        return "Fitness Details";
      case Screen.userProfile:
        return "Profile Info";
      case Screen.waitForVerification:
        return "Driver";
      default:
        return "My App";
    }
  }
}
