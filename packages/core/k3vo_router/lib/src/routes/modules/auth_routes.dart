import 'package:go_router/go_router.dart';
import 'package:k3vo_auth/k3vo_auth.dart';
import 'package:k3vo_router/k3vo_router.dart';

final authRoutes = [
  GoRoute(
    path: AuthRouteNames.auth,
    builder: (context, state) => const AuthScreen(),
  ),
];
