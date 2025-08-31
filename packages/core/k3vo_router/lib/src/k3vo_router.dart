import 'package:go_router/go_router.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_router/k3vo_router.dart';

/// {@template k3vo_router}
/// A Flutter routing package for managing in-app navigation in the K3VO platform client app.
/// {@endtemplate}
class K3voRouter {
  /// {@macro k3vo_router}
  const K3voRouter._(); // Prevent instantiation

  /// Creates the configured GoRouter instance for the app.
  static GoRouter createRouter() {
    final authStatusNotifier = getService<AuthStatusNotifier>();

    return GoRouter(
      initialLocation: AuthRouteNames.auth,
      refreshListenable: authStatusNotifier, // listens for changes
      routes: [
        ...authRoutes,
        ...homeRoutes,
        ...settingsRoutes,
      ],
      redirect: (context, state) {
        final status = authStatusNotifier.status;
        final loggingIn = state.fullPath == AuthRouteNames.auth;

        // If user is not logged in and not already on login page → redirect to login
        if (status == AuthStatus.unauthenticated && !loggingIn) {
          return AuthRouteNames.auth;
        }

        // If user is logged in but tries to go to login page → redirect home
        if (status == AuthStatus.authenticated && loggingIn) {
          return HomeRouteNames.home;
        }

        // If still unknown, don’t redirect (stay on splash/loading)
        return null;
      },
    );
  }
}
