import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.k3voL10n.settings)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThemeColorSelectorWidget(
              themeCollection: const AppThemes().themeCollection,
              selectedTheme: AdaptiveChameleonTheme.of(context).themeId,
            ),
            const Divider(),
            _buildThemeMenu(context),
            const Divider(),
            const ThemeModeSelectorWidget(),
            const Divider(),
            K3voListTile(
              title: context.k3voL10n.language,
              subtitle: context
                  .watch<LanguageCubit>()
                  .state
                  .selectedLanguage
                  .label,
              leadingIcon: Icons.translate_outlined,
              onTap: () {
                showLanguageSelectionSheet(context);
              },
              showDivider: true,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the theme menu item in the appearance section.
  ///
  /// This method creates a menu item for selecting the app's theme.
  Widget _buildThemeMenu(BuildContext context) {
    return K3voListTile(
      leadingIcon: Icons.color_lens,
      title: context.k3voL10n.theme,
      subtitle: const AppThemes().toStr(
        AdaptiveChameleonTheme.of(context).themeId,
      ),
      onTap: () {
        _setRandomTheme(context);
      },
    );
  }

  void _setRandomTheme(BuildContext context) {
    const themeIds = <int>[
      AppThemes.green,
      AppThemes.red,
    ];

    final currentThemeId = AdaptiveChameleonTheme.of(context).themeId;

    int randomThemeId;
    do {
      final randomIndex = Random().nextInt(themeIds.length);
      randomThemeId = themeIds[randomIndex];
    } while (randomThemeId == currentThemeId);

    AdaptiveChameleonTheme.of(context).setTheme(randomThemeId);
  }
}
