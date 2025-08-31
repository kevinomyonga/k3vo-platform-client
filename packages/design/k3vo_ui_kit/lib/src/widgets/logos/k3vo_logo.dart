import 'package:flutter/material.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

/// K3vo Logo Widget
///
/// - Displays the MotyBase logo in black or white based on theme if [color] is null.
/// - If [color] is provided, applies that color as a tint.
/// - [size] constrains logo size if provided. If null, expands as large as parent allows.
/// - [hasShadow] adds a shadow respecting transparent areas.
/// - [shadowOffset] adjusts the shadow position.
class K3voLogo extends StatelessWidget {
  const K3voLogo({
    super.key,
    this.size,
    this.color,
    this.hasShadow = false,
    this.shadowOffset = const Offset(10, 20),
  });

  final double? size;
  final Color? color;
  final bool hasShadow;
  final Offset shadowOffset;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    final logoPath = Assets.images.branding.logo.keyName;

    /// Base logo widget
    Widget logo = Image.asset(
      logoPath,
      fit: BoxFit.contain,
      width: size,
      height: size,
      color:
          color ??
          (isDark
              ? null
              : null), // If color is set, apply it. Otherwise use default.
      colorBlendMode: color != null ? BlendMode.srcIn : null,
    );

    /// Swap asset path if no color is set (so default white/black logic applies)
    if (color == null) {
      logo = Image.asset(
        isDark
            ? Assets.images.branding.logo.keyName
            : Assets.images.branding.logo.keyName,
        fit: BoxFit.contain,
        width: size,
        height: size,
      );
    }

    /// Apply shadow logic if enabled
    if (hasShadow) {
      return SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: shadowOffset.dx,
                top: shadowOffset.dy,
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: .5),
                  BlendMode.srcIn,
                ),
                child: logo,
              ),
            ),
            logo,
          ],
        ),
      );
    }

    return size != null
        ? SizedBox(width: size, height: size, child: logo)
        : logo;
  }
}
