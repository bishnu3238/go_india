import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:go_india/data/repository/driver_repository.dart';
import 'package:go_india/data/repository/driver_details_repository.dart';
import 'package:go_india/data/repository/master_repository.dart';
import 'package:go_india/domain/repository/master_repository.dart';
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
    get.registerLazySingleton<Connectivity>(() => Connectivity());

    // Internet
    get.registerLazySingleton<InternetConnectivityCubit>(
        () => InternetConnectivityCubit(connectivity: get()));

    // AppNavigator
    get.registerLazySingleton(() => AppNavigator());

    // Network service
    get.registerLazySingleton<NetworkService>(() => NetworkService());

    // Notifier
    get.registerLazySingleton<Notifier>(() => Notifier());

    // Stores
    get.registerLazySingleton<CityStore>(() => CityStore());
    get.registerLazySingleton<ThemeStore>(() => ThemeStore());
    get.registerLazySingleton<DriverStore>(() => DriverStore());
    get.registerLazySingleton<VehicleTypeStore>(() => VehicleTypeStore());
    get.registerLazySingleton<DriverVehicleStore>(() => DriverVehicleStore());

    // Repository
    get.registerSingleton<CityRepository>(
        GoCityRepository(get(), get())..fetchCities());
    get.registerLazySingleton<DriverRepository>(
        () => GoDriverRepository(get(), get(), get()));
    get.registerLazySingleton<DriverDetailsRepository>(
      () => GoDriverDetailsRepository(get(), get(), get()),
    );
    get.registerLazySingleton<MasterRepository>(
      () => GoIndiaMasterRepository(get())

    );

    // [Authentication]
    //
    // auth repositories [LogIn] [Signup] [reset instruction]
    // getIt.registerSingleton<UserStore>(UserStore());
    get.registerSingleton<AuthRepository>(
      UserAuthRepository(
        driverStore: get<DriverStore>(),
        networkService: get<NetworkService>(),
      )..driver.first,
    );

    // logic
    get.registerSingleton<ApplicationBloc>(
      ApplicationBloc(
        authRepository: get(),
        driverRepository: get(),
        driverDetailsRepository: get(),
      ),
    );

    // Pages
    // Splash
    get.registerLazySingleton<SplashCubit>(() => SplashCubit()..initial());

    //welcome driver details
    get.registerLazySingleton<WelcomeDriverDetailsCubit>(
        () => WelcomeDriverDetailsCubit(
              get(),
              get(),
              get(),
              get(),
            ));
    // welcome
    get.registerLazySingleton<WelcomeCubit>(() => WelcomeCubit(get()));

    // Home
    get.registerLazySingleton<HomeBloc>(() => HomeBloc(
          get(),
        ));

    // App router
    // getIt.registerLazySingleton<AppRouter>(() => AppRouter(getIt(), getIt()));
  }
}
