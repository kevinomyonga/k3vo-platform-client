import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

/// {@template app_dark_themes}
/// Provides dark mode themes for the application.
/// {@endtemplate}
class AppDarkThemes extends AppThemes {
  /// Creates an instance of [AppDarkThemes].
  ///
  /// The [AppDarkThemes] class defines various dark mode themes for the
  /// application, including specific themes for teal, purple, amber, blue,
  /// and red color schemes.
  const AppDarkThemes();

  /// Provides the base `ThemeData` for the app UI.
  ///
  /// Returns a [ThemeData] instance with default dark theme settings.
  @override
  ThemeData get themeData {
    /// Returns the base dark theme for the application.
    return ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: GoogleFonts.lato().fontFamily,
    );
  }

  /// Returns the dark theme with a green color scheme.
  ThemeData get greenThemeDark {
    final base = themeData;
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryGreenColor,
        brightness: Brightness.dark,
      ),
    );
  }

  /// Returns the dark theme with a red color scheme.
  ThemeData get redThemeDark {
    final base = themeData;
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryRedColor,
        brightness: Brightness.dark,
      ),
    );
  }

  /// Provides a collection of dark themes for the application.
  ThemeCollection get themeCollectionDark {
    return ThemeCollection(
      themes: {
        AppThemes.green: greenThemeDark,
        AppThemes.red: redThemeDark,
      },
      // Optional fallback theme, default value is ThemeData.dark()
      fallbackTheme: ThemeData.dark(),
    );
  }
}
