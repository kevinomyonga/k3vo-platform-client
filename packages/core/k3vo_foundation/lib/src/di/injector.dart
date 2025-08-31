import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:k3vo_auth/k3vo_auth.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
// import 'package:k3vo_foundation/src/di/injector.config.dart';
import 'package:k3vo_localization/k3vo_localization.dart';
import 'package:k3vo_router/k3vo_router.dart';

/// The instance of [GetIt] used for dependency injection.
///
/// This singleton instance of [GetIt] is used throughout the application
/// to manage and access various dependencies. It allows for the registration
/// and retrieval of service instances in a centralized manner.
final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> setupDependencies() async {
  // 1. Register AuthBloc + AuthStatusNotifier
  getIt
    ..registerLazySingleton<AuthBloc>(AuthBloc.new)
    ..registerLazySingleton<AuthStatusNotifier>(
      () => AuthStatusNotifier(getIt<AuthBloc>()),
    )
    ..registerLazySingleton<DateFormatter>(K3voDateFormatter.new)
    ..registerLazySingleton<LanguageCubit>(LanguageCubit.new);

  // 2. Now that AuthStatusNotifier exists, create router
  final router = K3voRouter.createRouter();

  // 3. Register NavigationService with the router
  getIt.registerSingleton<NavigationService>(NavigationService(router));
}

/// Internal getter for accessing registered services within foundation.
///
/// Prefer exposing public helper functions instead of using _getIt directly.
T getService<T extends Object>() => getIt<T>();
