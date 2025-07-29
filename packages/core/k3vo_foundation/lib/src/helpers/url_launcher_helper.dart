import 'package:url_launcher/url_launcher.dart';

/// A helper class to handle launching URLs, making phone calls, and sending
/// emails.
class UrlLauncherHelper {
  /// Launches a URL using the `url_launcher` package.
  /// Throws [Exception] if the URL cannot be launched.
  static Future<void> launchWebUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  /// Launches a phone dialer with the given phone number.
  static Future<void> launchPhone(String phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not dial $phoneNumber');
    }
  }

  /// Launches an email client with the given email address.
  static Future<void> launchEmail(
    String email,
    String subject,
    String body,
  ) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': subject, 'body': body},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not send email to $email');
    }
  }
}
