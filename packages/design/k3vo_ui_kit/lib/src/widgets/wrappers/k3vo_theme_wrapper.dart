import 'package:adaptive_chameleon_theme/adaptive_chameleon_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

class K3voThemeWrapper extends StatelessWidget {
  const K3voThemeWrapper({
    required this.router,
    required this.selectedLanguage,
    required this.localizationsDelegates,
    required this.supportedLocales,
    super.key,
  });
  final RouterConfig<Object>? router;
  final Locale? selectedLanguage;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final Iterable<Locale> supportedLocales;

  @override
  Widget build(BuildContext context) {
    return AdaptiveChameleonThemeWidget(
      themeCollection: const AppThemes().themeCollection,
      darkThemeCollection: const AppDarkThemes().themeCollectionDark,
      builder: (context, theme, darkTheme, themeMode) {
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, language) {
            return MaterialApp.router(
              theme: theme,
              darkTheme: darkTheme,
              themeMode: themeMode,
              locale: language.selectedLanguage.locale,
              localizationsDelegates: localizationsDelegates,
              supportedLocales: supportedLocales,
              routerConfig: router,
            );
          },
        );
        // return MaterialApp.router(
        //   theme: theme,
        //   darkTheme: darkTheme,
        //   themeMode: themeMode,
        //   locale: selectedLanguage,
        //   localizationsDelegates: localizationsDelegates,
        //   supportedLocales: supportedLocales,
        //   routerConfig: router,
        // );
      },
    );
  }
}
