import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

/// A helper class to facilitate sharing content using the `share_plus` package.
class ShareHelper {
  /// Shares a message with the given [text] and [subject].
  ///
  /// [context] is used to find the render box for positioning the share popup.
  Future<void> shareText({
    required BuildContext context,
    required String text,
    String? subject,
  }) async {
    final box = context.findRenderObject() as RenderBox?;
    if (box != null) {
      await SharePlus.instance.share(
        ShareParams(
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
        ),
      );
    }
  }

  Future<void> shareFiles(
    BuildContext context,
    List<XFile>? files, {
    String? text,
    String? subject,
  }) async {
    final box = context.findRenderObject() as RenderBox?;
    if (box != null) {
      await SharePlus.instance.share(
        ShareParams(
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
          files: files,
        ),
      );
    }
  }
}
