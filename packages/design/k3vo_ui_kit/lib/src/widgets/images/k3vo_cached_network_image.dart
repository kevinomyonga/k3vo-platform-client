import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

/// {@template motybase_cached_network_image}
/// A wrapper around [CachedNetworkImage] with graceful fallbacks and
/// customizable styling.
/// {@endtemplate}
class MotyBaseCachedNetworkImage extends StatelessWidget {
  /// {@macro motybase_cached_network_image}
  const MotyBaseCachedNetworkImage({
    required this.imageUrl,
    super.key,
    this.fit = BoxFit.cover,
    this.placeholderImagePath,
    this.borderRadius,
    this.semanticLabel,
  });

  /// The URL of the image to load.
  final String imageUrl;

  /// How the image should be inscribed into the space.
  final BoxFit fit;

  /// Local asset image to show on error.
  final String? placeholderImagePath;

  /// Optional border radius for rounding the image.
  final BorderRadius? borderRadius;

  /// Optional accessibility label for screen readers.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel ?? 'Image from $imageUrl',
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
          ),
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Image.asset(
            placeholderImagePath ?? Assets.images.placeholder.keyName,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
