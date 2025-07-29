/// An extension on `String` to provide casing utilities.
extension StringCasingExtension on String {
  /// Capitalizes the first letter of the string and leaves the rest unchanged.
  String get toCapitalized {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Converts the string to title case (each word starts with uppercase).
  ///
  /// Handles punctuation and apostrophes correctly. Words inside
  /// parentheses or containing special characters are also processed.
  String get toCamelCase {
    return splitMapJoin(
      RegExp(r"[\wÀ-ÿ]+('[\wÀ-ÿ]+)?"), // Handles accents and apostrophes
      onMatch: (m) {
        final word = m[0]!;
        return '${word[0].toUpperCase()}${word.substring(1)}';
      },
      onNonMatch: (n) => n,
    );
  }
}
