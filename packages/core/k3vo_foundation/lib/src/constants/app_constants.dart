/// App-wide constants for the MotyBase platform.
///
/// These constants cover branding, URLs, legal links, support contacts, and
/// public store links. For API-specific or backend-related constants, refer
/// to motybase_data instead.
abstract class AppConstants {
  /// App name and branding.
  static const String appName = 'K3VO';

  /// Developer/company website.
  static const String appDeveloperWebsite = 'https://kevinomyonga.com';

  /// General contact email.
  static const String appCompanyEmail = 'info@knoeyes.com';

  /// Support contact email.
  static const String appCompanySupportEmail = 'support@knoeyes.com';

  /// Copyright information.
  static const String appCopyright = '© 2025';

  /// Web app URL.
  static const String appWebAppUrl = 'https://app.k3vo.me.ke';

  /// Public website URL.
  static const String appWebsiteUrl = 'https://k3vo.me.ke';

  /// Cancellation Policy page link.
  static const String cancellationPolicyUrl =
      '$appWebsiteUrl/legal/cancellation';

  /// Privacy Policy page link.
  static const String privacyPolicyUrl = '$appWebsiteUrl/legal/privacy';

  /// Terms of Service page link.
  static const String termsOfServiceUrl = '$appWebsiteUrl/legal/terms';

  /// Help page link.
  static const String helpUrl = '$appWebsiteUrl/help';

  /// Account Deactivation page link.
  static const String accountDeactivationUrl =
      '$appWebsiteUrl/account/deactivation';

  /// Apple App Store Id.
  static const String appAppleStoreId = '6450117164';

  /// Apple App Store link.
  static const String appAppleStoreUrl =
      'https://apps.apple.com/ke/app/motybase/id$appAppleStoreId';

  /// Google Play Store link.
  static const String appGooglePlayUrl =
      'https://play.google.com/store/apps/details?id=ke.me.k3vo.app';
}
