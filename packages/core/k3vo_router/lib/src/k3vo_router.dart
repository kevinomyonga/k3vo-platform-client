import 'package:go_router/go_router.dart';
import 'package:k3vo_router/k3vo_router.dart';

/// {@template k3vo_router}
/// A Flutter routing package for managing in-app navigation in the K3VO platform client app.
/// {@endtemplate}
class K3voRouter {
  /// {@macro k3vo_router}
  const K3voRouter._(); // Prevent instantiation

  /// Creates the configured GoRouter instance for the app.
  static GoRouter createRouter({bool isLoggedIn = false}) {
    return GoRouter(
      initialLocation: HomeRouteNames.home,
      routes: [
        ...homeRoutes,
      ],
      // redirect: (context, state) {
      //   final loggingIn = state.fullPath == AuthRouteNames.login;

      //   if (!isLoggedIn && !loggingIn) {
      //     return AuthRouteNames.login;
      //   }

      //   if (isLoggedIn && loggingIn) {
      //     return HomeRouteNames.home;
      //   }

      //   return null;
      // },
    );
  }
}
