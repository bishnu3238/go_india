import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:go_india/data/repository/driver_repository.dart';
import 'package:go_india/data/repository/driver_details_repository.dart';
import 'package:go_india/screens/home/export.dart';
import '../../domain/store/store.dart';
import '../../screens/splash/export.dart';
import '../../screens/welcome/export.dart';
import '../../package/package/package.dart';
import '../../domain/repository/repository.dart';
import '../../data/repository/city_repository.dart';
import '../../screens/welcome_driver_details/export.dart';
import '../utility/utility.dart';

class GetItRegisterSingleton {
  GetItRegisterSingleton._();
  static final GetItRegisterSingleton _instance = GetItRegisterSingleton._();
  static GetItRegisterSingleton get instance => _instance;

  void init() async {
    // Packages
    getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    // Internet
    getIt.registerLazySingleton<InternetConnectivityCubit>(
        () => InternetConnectivityCubit(connectivity: getIt()));

    // AppNavigator
    getIt.registerLazySingleton(() => AppNavigator());

    // Network service
    getIt.registerLazySingleton<NetworkService>(() => NetworkService());

    // Notifier
    getIt.registerLazySingleton<Notifier>(() => Notifier());

    // Stores
    getIt.registerLazySingleton<CityStore>(() => CityStore());
    getIt.registerLazySingleton<ThemeStore>(() => ThemeStore());
    getIt.registerLazySingleton<DriverStore>(() => DriverStore());
    getIt.registerLazySingleton<VehicleTypeStore>(() => VehicleTypeStore());
    getIt.registerLazySingleton<DriverVehicleStore>(() => DriverVehicleStore());

    // Repository
    getIt.registerSingleton<CityRepository>(
        GoCityRepository(getIt(), getIt())..fetchCities());
    getIt.registerLazySingleton<DriverRepository>(
        () => GoDriverRepository(getIt(), getIt(), getIt()));
    getIt.registerLazySingleton<DriverDetailsRepository>(
      () => GoDriverDetailsRepository(getIt(),getIt(), getIt()),
    );

    // [Authentication]
    //
    // auth repositories [LogIn] [Signup] [reset instruction]
    // getIt.registerSingleton<UserStore>(UserStore());
    getIt.registerSingleton<AuthRepository>(
      UserAuthRepository(
        driverStore: getIt<DriverStore>(),
        networkService: getIt<NetworkService>(),
      )..driver.first,
    );

    // logic
    getIt.registerSingleton<ApplicationBloc>(
       ApplicationBloc(
        authRepository: getIt(),
        driverRepository: getIt(),
        driverDetailsRepository: getIt(),
      ),
    );

    // Pages
    // Splash
    getIt.registerLazySingleton<SplashCubit>(() => SplashCubit()..initial());

    //welcome driver details
    getIt.registerLazySingleton<WelcomeDriverDetailsCubit>(
        () => WelcomeDriverDetailsCubit(
              getIt(),
              getIt(),
              getIt(),
              getIt(),
            ));
    // welcome
    getIt.registerLazySingleton<WelcomeCubit>(() => WelcomeCubit(getIt()));

    // Home
    getIt.registerLazySingleton<HomeBloc>(() => HomeBloc(getIt(),));



    // App router
    // getIt.registerLazySingleton<AppRouter>(() => AppRouter(getIt(), getIt()));
  }
}
