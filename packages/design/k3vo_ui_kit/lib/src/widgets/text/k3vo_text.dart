import 'package:flutter/material.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

/// The available MotyBase text styles tied to the Flutter text theme.
enum K3voTextType {
  /// Used for large display text, typically for banners or headlines.
  displayLarge,

  /// Used for medium display text, ideal for prominent headings.
  displayMedium,

  /// Used for small display text, slightly smaller than displayMedium.
  displaySmall,

  /// Used for large headlines, often in sections or pages.
  headlineLarge,

  /// Used for medium headlines, suitable for subheadings.
  headlineMedium,

  /// Used for small headlines, useful for minor section headers.
  headlineSmall,

  /// Used for large titles, typically at the top of cards or screens.
  titleLarge,

  /// Used for medium titles, suitable for mid-tier emphasis.
  titleMedium,

  /// Used for small titles, ideal for minor elements.
  titleSmall,

  /// Used for large labels, often in form fields or buttons.
  labelLarge,

  /// Used for medium labels, typically on interactive elements.
  labelMedium,

  /// Used for small labels, for compact interfaces.
  labelSmall,

  /// Used for large body text, optimal for readable content.
  bodyLarge,

  /// Used for medium body text, typically paragraph content.
  bodyMedium,

  /// Used for small body text, suitable for hints or footnotes.
  bodySmall,
}

/// Defines casing transformations to apply to the text.
enum K3voTextCasing {
  /// Leave text as-is.
  normal,

  /// Capitalize the first letter of each word.
  camelCase,

  /// Convert all text to uppercase.
  allCaps,
}

/// A reusable text widget that applies consistent styles and casing.
class K3voText extends StatelessWidget {
  /// Creates a K3vo text widget.
  ///
  /// [text] is required and displayed according to the [type] and [casing].
  const K3voText({
    required this.text,
    this.type = K3voTextType.bodyLarge,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.shadows,
    this.hasShadow = false,
    this.casing = K3voTextCasing.normal,
    super.key,
  });

  /// The text content to display.
  final String text;

  /// The type of text style to apply from the theme.
  final K3voTextType type;

  /// The color to apply to the text.
  final Color? color;

  /// The font weight to apply.
  final FontWeight? fontWeight;

  /// The alignment of the text.
  final TextAlign? textAlign;

  /// The maximum number of lines to display.
  final int? maxLines;

  /// Overflow behavior if the text exceeds its bounds.
  final TextOverflow? overflow;

  /// List of shadow effects to apply.
  final List<Shadow>? shadows;

  /// Whether to apply a default shadow from the theme.
  final bool hasShadow;

  /// The casing to apply to the text.
  final K3voTextCasing casing;

  @override
  Widget build(BuildContext context) {
    final baseStyle = _getTextStyle(context, type);

    // Apply casing transformation based on the enum
    final displayText = switch (casing) {
      K3voTextCasing.normal => text,
      K3voTextCasing.camelCase => text.toCamelCase,
      K3voTextCasing.allCaps => text.toUpperCase(),
    };

    return Text(
      displayText,
      style: baseStyle.copyWith(
        color: color,
        fontWeight: fontWeight,
        shadows: hasShadow ? AppShadows.shadows : shadows,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Returns a text style from the current theme based on the [type].
  TextStyle _getTextStyle(BuildContext context, K3voTextType type) {
    final textTheme = Theme.of(context).textTheme;

    switch (type) {
      case K3voTextType.displayLarge:
        return textTheme.displayLarge!;
      case K3voTextType.displayMedium:
        return textTheme.displayMedium!;
      case K3voTextType.displaySmall:
        return textTheme.displaySmall!;
      case K3voTextType.headlineLarge:
        return textTheme.headlineLarge!;
      case K3voTextType.headlineMedium:
        return textTheme.headlineMedium!;
      case K3voTextType.headlineSmall:
        return textTheme.headlineSmall!;
      case K3voTextType.titleLarge:
        return textTheme.titleLarge!;
      case K3voTextType.titleMedium:
        return textTheme.titleMedium!;
      case K3voTextType.titleSmall:
        return textTheme.titleSmall!;
      case K3voTextType.labelLarge:
        return textTheme.labelLarge!;
      case K3voTextType.labelMedium:
        return textTheme.labelMedium!;
      case K3voTextType.labelSmall:
        return textTheme.labelSmall!;
      case K3voTextType.bodyLarge:
        return textTheme.bodyLarge!;
      case K3voTextType.bodyMedium:
        return textTheme.bodyMedium!;
      case K3voTextType.bodySmall:
        return textTheme.bodySmall!;
    }
  }
}
