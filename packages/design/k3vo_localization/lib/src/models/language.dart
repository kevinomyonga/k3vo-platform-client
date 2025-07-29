import 'dart:ui';

/// Represents different languages supported in the application.
enum Language {
  /// English language option.
  english(Locale('en'), 'English'),

  /// French language option.
  french(Locale('fr'), 'Français'),

  /// Swahili language option.
  swahili(Locale('sw'), 'Kiswahili');

  const Language(this.locale, this.label);

  /// The [Locale] associated with this language.
  final Locale locale;

  /// The display text for this language.
  final String label;
}
