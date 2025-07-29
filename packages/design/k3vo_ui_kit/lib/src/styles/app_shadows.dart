import 'package:flutter/material.dart';

/// A utility class that provides common shadows used across the app.
///
/// The [AppShadows] class offers a centralized place to manage and reuse
/// shadow styles throughout the application, ensuring consistency and
/// maintainability.
class AppShadows {
  /// A list of [Shadow] objects to be applied for text or UI elements.
  ///
  /// This list contains a shadow with a black color, an offset, and a
  /// blur radius to create a subtle shadow effect.
  static List<Shadow> shadows = [
    Shadow(
      color: Colors.black45.withValues(alpha: .9),
      offset: const Offset(2.5, 5),
      blurRadius: 15,
    ),
  ];

  static List<BoxShadow> boxShadows = [
    BoxShadow(
      color: Colors.black.withValues(alpha: .5),
      blurRadius: 4,
      spreadRadius: 2,
      offset: const Offset(0, 2),
    ),
  ];
}
