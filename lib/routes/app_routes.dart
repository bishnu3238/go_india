// ignore_for_file: dead_code, unused_local_variable

import 'dart:async';
import 'package:go_india/screens/profile_settings/sub_profile_settings/edit_user_profile/edit_user_profile_navigator.dart';

import '../main.dart';
import '../domain/store/store.dart';
import '../screens/home/export.dart';
import '../screens/splash/export.dart';
import 'package:flutter/material.dart';
import '../screens/welcome/export.dart';
import '../package/package/package.dart';
import '../utility/utility/utility.dart';
import 'package:go_router/go_router.dart';
import '../screens/add_new_vehicle/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/routes/route_path.dart';
import '../screens/profile_settings/export.dart';
import '../screens/start_application/export.dart';
import '../screens/wait_for_verification/export.dart';
import '../screens/welcome_driver_details/export.dart';
import '../screens/driver_initial_details/export.dart';
import '../screens/on_boarding/on_boarding_navigator.dart';

class AppRouter {
  // late final AppService appService;

  AppRouter();
  static GoRouter get router => _goRouter;

  static final GoRouter _goRouter = GoRouter(
    routerNeglect: true,
    debugLogDiagnostics: true,
    initialLocation: initialPage,
    restorationScopeId: 'router',
    routes: <GoRoute>[
      SplashRoute.page(),
      OnBoardingRoute.page(),
      LoginRoute.page(),
      SignUpRoute.page(),
      OtpRoute.page(),
      WelcomeDriverRoute.page(),
      WelcomeRoute.page(),
      AddNewVehicleRoute.page(),
      DriverInitialDetailsRoute.page(),
      UserProfileRoute.page(),
      EditUserProfileRoute.page(),
      WaitForVerificationRoute.page(),
      HomeRoute.page(),
      SupportRoute.page(),
      StartApplicationRoute.page(),
      ProfileSettingsRoute.page(),
      SetPreferencesRoute.page(),
    ],
    errorBuilder: (ctx, state) => Scaffold(
      body: Center(child: Text(state.extra.toString())),
    ),
    refreshListenable: GoRouterRefreshBloc(
      get<DriverStore>(),
      get<DriverVehicleStore>(),
    ),
    redirect: (ctx, state) {
      // Store
      var store = get<DriverStore>().state;
      var detailsInfo = ctx.read<DriverInitialDetailsCubit>().state;
      var vStore = get<DriverVehicleStore>().state;

      store.log();
      vStore.log();
      // path
      var otp = Screen.otp.cName;
      var home = Screen.home.cName;
      var login = Screen.login.cName;
      var splash = Screen.splash.cName;
      var signUp = Screen.signUp.cName;
      var welcome = Screen.welcome.cName;
      var onBoarding = Screen.onBoarding.cName;
      var onBoardingPath = Screen.onBoarding.path;
      var addNewVehicle = Screen.addVehicle.cName;
      var waitingDriver = Screen.waitForVerification.cName;
      var driverDetails = Screen.driverInitialDetails.cName;
      var welcomeDriver = Screen.welcomeDriverDetails.cName;

      'vStore.status: ${store.status} ${vStore.status}'.log();
      // location
      final otpLocation = state.namedLocation(otp);
      final homeLocation = state.namedLocation(home);
      final loginLocation = state.namedLocation(login);
      final signupLocation = state.namedLocation(signUp);
      final splashLocation = state.namedLocation(splash);
      final welcomeLocation = state.namedLocation(welcome);
      final onboardLocation = state.namedLocation(onBoarding);
      final addNewVehicleLocation = state.namedLocation(addNewVehicle);
      final waitingLocation = state.namedLocation(waitingDriver);
      final welcomeDriverLocation = state.namedLocation(welcomeDriver);
      final driverDetailsLocation = state.namedLocation(driverDetails);

      // booleans
      final isInToOtpPage = state.matchedLocation == otpLocation;
      final isInToLoginPage = state.matchedLocation == loginLocation;
      final isInToSplashPage = state.matchedLocation == splashLocation;
      final isInToSignUpPage = state.matchedLocation == signupLocation;
      final isInToOnboardingPage = state.matchedLocation == onboardLocation;
      final isFirstTimeInstall = store.authStatus == AuthStatus.unknown;
      final isAuthenticated = store.authStatus == AuthStatus.authenticated;
      final isWelcomeDriverDetails =
          store.status == 1 && store.id == '0'; // go to welcome;
      final isAddNewVehicle = store.status == 1 &&
          store.id != '0' &&
          vStore.driverId == '0'; // go to add new driver;

      final isWelcome = (store.status == 1 &&
              vStore.status == '0' &&
              vStore.driverId != '0') &&
          store.id != '0'; // go to welcome
      final isProfileWaiting = (store.status == 1 && vStore.status == '1') ||
          (store.status == 2 && vStore.status == '1') ||
          (store.status == 1 && vStore.status == '2') && store.id != '0';
      final isProfileComplete = store.status == 2 && vStore.status == '2';

      if (isInToOnboardingPage) {
        if (isFirstTimeInstall) return null;
        return loginLocation;
      }

      if (isInToLoginPage) {
        if (!isAuthenticated) return null;
        if (isAuthenticated && isWelcomeDriverDetails)
          return welcomeDriverLocation;
        if (isAuthenticated && isAddNewVehicle) return addNewVehicleLocation;
        if (isAuthenticated && isWelcome) return driverDetailsLocation;
        if (isAuthenticated && isProfileWaiting) return waitingLocation;
        if (isAuthenticated && isProfileComplete) return homeLocation;
      }
      if (!isAuthenticated &&
          (!isInToLoginPage &&
              !isInToOtpPage &&
              !isInToSignUpPage &&
              !isInToSplashPage)) return loginLocation;
      if (isAuthenticated && isProfileComplete) return homeLocation;

      if (!isAuthenticated && isInToLoginPage) return null;

      return null;

      // // If going to onboarding screen;
      // if (isGoingToOnboarding) {
      //   // check is first time install or not, if first time go onboarding page;
      //   if (isFirstTimeInstall) {
      //     return onboardLocation;
      //   }
      //   // else check if authenticated and profile complete go home screen;
      //   else if (isAuthenticated && isProfileComplete) {
      //     return homeLocation;
      //   }
      //   // if authenticated and profile not complete go welcomeDriverDetails page;
      //
      //   else if (isAuthenticated && !isProfileComplete) {
      //     return welcomeDriverLocation;
      //   }
      //   // if not authenticated go to login page ;
      //
      //   else if (!isAuthenticated) {
      //     return loginLocation;
      //   } else {
      //     return state.matchedLocation;
      //   }
      // }
      //
      // //   //
      // //   // final isLongedIn = appService.loginState;
      // //   // final isInitialized = appService.initialized;
      // //   // final isOnboarded = appService.onboarding;
      // //   //
      // //   // final isGoingToLogin = state.sunblock == loginLocation;
      // //   // final isGoingToInit = state.sunblock == splashLocation;
      // //   // final isGoingToOnboard = state.sunblock == onboardLocation;
      // //
      // //   // If not Initialized and not going to Initialized redirect to Splash
      // //   // if (!isInitialized && !isGoingToInit) {
      // //   //   return splashLocation;
      // //   //   // If not onboard and not going to onboard redirect to OnBoarding
      // //   // } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
      // //   //   return onboardLocation;
      // //   //   // If not logged and not going to login redirect to Login
      // //   // } else if (isInitialized && isOnboarded && !isLoggedIn && !isGoingToLogin) {
      // //   //   return loginLocation;
      // //   //   // If all the scenarios are cleared but still going to any of that screen redirect to Home
      // //   // } else if ((isLoggedIn && isGoingToLogin) || (isInitialized && isGoingToInit) || (isOnboarded && isGoingToOnboard)) {
      // //   //   return homeLocation;
      // //   // } else {
      // //   //   // Else Don't do anything
      // //   //   return null;
      // //   // }
    },
  );
}

class GoRouterRefreshBloc<BLOC extends BlocBase<STATE>, STATE,
    BLOC2 extends BlocBase<STATE2>, STATE2> extends ChangeNotifier {
  GoRouterRefreshBloc(BLOC bloc, BLOC2 bloc2) {
    _blocStream = bloc.stream.listen(
      (STATE _) => notifyListeners(),
    );
    _blocStream2 = bloc2.stream.listen(
      (STATE2 _) => notifyListeners(),
    );
  }

  late final StreamSubscription<STATE> _blocStream;
  late final StreamSubscription<STATE2> _blocStream2;

  @override
  void dispose() {
    _blocStream.cancel();
    _blocStream2.cancel();
    super.dispose();
  }
}
