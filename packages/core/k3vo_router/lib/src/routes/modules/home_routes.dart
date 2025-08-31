import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:k3vo_generator/k3vo_generator.dart';
import 'package:k3vo_home/k3vo_home.dart';
import 'package:k3vo_lookup/k3vo_lookup.dart';
import 'package:k3vo_router/k3vo_router.dart';

final homeRoutes = [
  ShellRoute(
    navigatorKey: GlobalKey<NavigatorState>(),
    builder: (context, state, child) {
      return HomeShell(child: child);
    },
    routes: [
      GoRoute(
        path: HomeRouteNames.home,
        builder: (context, state) => const DiscoverScreen(),
      ),
      GoRoute(
        path: HomeRouteNames.search,
        builder: (context, state) => const LookupScreen(),
      ),
      GoRoute(
        path: HomeRouteNames.generator,
        builder: (context, state) => const GeneratorWizardScreen(),
      ),
      GoRoute(
        path: HomeRouteNames.myDomains,
        builder: (context, state) => const DomainsScreen(),
      ),
      GoRoute(
        path: HomeRouteNames.more,
        builder: (context, state) => const MoreScreen(),
      ),
    ],
  ),
];
