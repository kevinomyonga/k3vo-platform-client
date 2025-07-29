import 'package:intl/intl.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';

class K3voDateFormatter implements DateFormatter {
  @override
  String formatChatTimestamp(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return DateFormat.jm().format(dateTime); // e.g., 2:45 PM
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return DateFormat.E().format(dateTime); // Mon, Tue
    } else {
      return DateFormat.yMd().format(dateTime); // 7/17/2025
    }
  }
}
