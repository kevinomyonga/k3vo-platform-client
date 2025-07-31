import 'package:go_router/go_router.dart';
import 'package:k3vo_router/k3vo_router.dart';
import 'package:k3vo_settings/k3vo_settings.dart';

final settingsRoutes = [
  GoRoute(
    path: SettingsRouteNames.settings,
    builder: (context, state) => const SettingsScreen(),
  ),
  GoRoute(
    path: SettingsRouteNames.about,
    builder: (context, state) => const AboutAppScreen(),
  ),
];
