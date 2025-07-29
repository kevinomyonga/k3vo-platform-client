import 'package:flutter/material.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_localization/k3vo_localization.dart';
import 'package:k3vo_router/k3vo_router.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return K3voBlocProviders(
      child: K3voThemeWrapper(
        selectedLanguage: null,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        router: getIt<NavigationService>().router,
      ),
    );

    // return MaterialApp(
    //   theme: ThemeData(
    //     appBarTheme: AppBarTheme(
    //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //     ),
    //     useMaterial3: true,
    //   ),
    //   localizationsDelegates: AppLocalizations.localizationsDelegates,
    //   supportedLocales: AppLocalizations.supportedLocales,
    //   home: const CounterPage(),
    // );
  }
}
