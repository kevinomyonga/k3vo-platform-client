import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:path_provider/path_provider.dart';

/// {@template k3vo_foundation}
/// A Flutter package that contains foundational utilities, constants, and helpers for the K3VO platform client app.
/// {@endtemplate}
class K3voFoundation {
  /// {@macro k3vo_foundation}
  const K3voFoundation();

  static late Env env;

  /// Initializes the HydratedBloc storage and dependency injection.
  static Future<void> initialize({required Env envConfig}) async {
    // Store env config
    env = envConfig;

    final storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory(
              (await getApplicationDocumentsDirectory()).path,
            ),
    );
    HydratedBloc.storage = storage;

    // Dependency Injection
    await setupDependencies();
  }
}
