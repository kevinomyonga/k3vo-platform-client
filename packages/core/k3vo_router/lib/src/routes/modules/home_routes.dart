import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:motybase_account/motybase_account.dart';
// import 'package:motybase_communication/motybase_communication.dart';
import 'package:k3vo_home/k3vo_home.dart';
import 'package:k3vo_router/k3vo_router.dart';
// import 'package:motybase_profile/motybase_profile.dart';
// import 'package:motybase_router/src/routes/routes.dart';

final homeRoutes = [
  ShellRoute(
    navigatorKey: GlobalKey<NavigatorState>(),
    builder: (context, state, child) {
      return HomeShell(child: child);
    },
    routes: [
      GoRoute(
        path: HomeRouteNames.home,
        builder: (context, state) => const HomeMainScreen(),
      ),
      GoRoute(
        path: HomeRouteNames.profile,
        builder: (context, state) => const HomeMainScreen(),
      ),
      GoRoute(
        path: HomeRouteNames.settings,
        builder: (context, state) => const HomeMainScreen(),
      ),
    ],
  ),
];
