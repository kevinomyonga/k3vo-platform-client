import 'package:adaptive_chameleon_theme/adaptive_chameleon_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

/// {@template app_themes}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppThemes {
  /// Creates an instance of [AppThemes].
  ///
  /// This class provides various themes for the application including teal,
  /// purple, amber, blue, and red color schemes.
  const AppThemes();

  /// The app's themes.
  ///
  /// This code is used to connect readable names
  /// to integer theme IDs. Each integer constant
  /// represents a unique color theme for the application.

  /// The integer ID for the 'Ryokugyu' color theme.
  /// This theme ID is associated with the teal color scheme.
  static const int green = 0;

  /// The integer ID for the 'Fujitora' color theme.
  /// This theme ID is associated with the purple color scheme.
  /// used within the application.
  static const int red = 1;

  /// The integer ID for the 'Kizaru' color theme.
  /// This theme ID is associated with the amber color scheme.
  static const int black = 2;

  /// The integer ID for the 'Aokiji' color theme.
  /// This theme ID is associated with the blue color scheme.
  static const int white = 3;

  /// Converts a theme ID to its string representation.
  ///
  /// [themeId] is the ID of the theme to convert.
  /// Returns the name of the theme as a [String].
  String toStr(int themeId) {
    switch (themeId) {
      case green:
        return 'Ryokugyu';
      case red:
        return 'Fujitora';
      case black:
        return 'Kizaru';
      case white:
        return 'Aokiji';
      default:
        return 'Unknown';
    }
  }

  /// Provides the base `ThemeData` for the app UI.
  ///
  /// Returns a [ThemeData] instance with default light theme settings.
  ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: GoogleFonts.lato().fontFamily,
    );
  }

  /// Returns the light theme with a green color scheme.
  ///
  /// Uses [AppColors.primaryGreenColor] as the primary color.
  ThemeData get greenTheme {
    final base = themeData;
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryGreenColor,
      ),
    );
  }

  /// Returns the light theme with a red color scheme.
  ///
  /// Uses [AppColors.primaryRedColor] as the primary color.
  ThemeData get redTheme {
    final base = themeData;
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryRedColor,
      ),
    );
  }

  /// Returns the light theme with a black color scheme.
  ThemeData get blackTheme {
    final base = themeData;
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF121212), // near-black seed
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Colors.black, // force OLED black bg
    );
  }

  /// Returns the light theme with a white color scheme.
  ThemeData get whiteTheme {
    final base = themeData;
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFFAFAFA), // near-white seed
      ),
      scaffoldBackgroundColor: Colors.white, // force white bg
    );
  }

  /// Provides a collection of themes for the application.
  ///
  /// Includes themes for green, red, white, and black color schemes.
  /// Sets a fallback theme as [ThemeData.light].
  ThemeCollection get themeCollection {
    return ThemeCollection(
      themes: {
        green: greenTheme,
        red: redTheme,
        black: blackTheme,
        white: whiteTheme,
      },
      // Optional fallback theme, default value is ThemeData.light()
      fallbackTheme: ThemeData.light(),
    );
  }
}
