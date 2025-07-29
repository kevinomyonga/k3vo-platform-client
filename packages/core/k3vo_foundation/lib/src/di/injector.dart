import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:k3vo_foundation/src/bloc/language/language.dart';
// import 'package:k3vo_foundation/src/di/injector.config.dart';
import 'package:k3vo_foundation/src/services/date_formatter.dart';
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
  // Run codegen bindings
  // getIt.init();

  final router = K3voRouter.createRouter();
  getIt
    ..registerSingleton<NavigationService>(NavigationService(router))
    // Register DateFormatter implementation
    ..registerLazySingleton<DateFormatter>(K3voDateFormatter.new)
    // Register LanguageCubit implementation
    ..registerLazySingleton<LanguageCubit>(LanguageCubit.new);
}

/// Internal getter for accessing registered services within foundation.
///
/// Prefer exposing public helper functions instead of using _getIt directly.
T getService<T extends Object>() => getIt<T>();
