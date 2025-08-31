// dart format off
// coverage:ignore-file
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_sw.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
    Locale('sw')
  ];

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutK3vo.
  ///
  /// In en, this message translates to:
  /// **'About K3VO'**
  String get aboutK3vo;

  /// No description provided for @aboutTheDeveloper.
  ///
  /// In en, this message translates to:
  /// **'About The Developer'**
  String get aboutTheDeveloper;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @allRightsReserved.
  ///
  /// In en, this message translates to:
  /// **'All Rights Reserved.'**
  String get allRightsReserved;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'And'**
  String get and;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @appAuthor.
  ///
  /// In en, this message translates to:
  /// **'Kevin Omyonga'**
  String get appAuthor;

  /// No description provided for @appAuthorAlias.
  ///
  /// In en, this message translates to:
  /// **'Dr. KNO'**
  String get appAuthorAlias;

  /// No description provided for @appAuthorRole.
  ///
  /// In en, this message translates to:
  /// **'Software Architect, Engineer & Designer'**
  String get appAuthorRole;

  /// No description provided for @appCompanyName.
  ///
  /// In en, this message translates to:
  /// **'KNOEYES'**
  String get appCompanyName;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'K3VO'**
  String get appName;

  /// No description provided for @appPoweredBy.
  ///
  /// In en, this message translates to:
  /// **'Powered By'**
  String get appPoweredBy;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Access. Connection. Ownership'**
  String get appTagline;

  /// No description provided for @bookings.
  ///
  /// In en, this message translates to:
  /// **'Bookings'**
  String get bookings;

  /// No description provided for @business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get business;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @creative.
  ///
  /// In en, this message translates to:
  /// **'Creative'**
  String get creative;

  /// No description provided for @dangerZone.
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get dangerZone;

  /// No description provided for @deactivateAccount.
  ///
  /// In en, this message translates to:
  /// **'Deactivate Account'**
  String get deactivateAccount;

  /// No description provided for @discover_expiringSoon.
  ///
  /// In en, this message translates to:
  /// **'{count} domains expiring in the next {days} days.'**
  String discover_expiringSoon(Object count, Object days);

  /// No description provided for @discover_generateNames.
  ///
  /// In en, this message translates to:
  /// **'Generate Names'**
  String get discover_generateNames;

  /// No description provided for @discover_latestFromKenic.
  ///
  /// In en, this message translates to:
  /// **'Latest from KeNIC'**
  String get discover_latestFromKenic;

  /// No description provided for @discover_lookupDomains.
  ///
  /// In en, this message translates to:
  /// **'Lookup Domains'**
  String get discover_lookupDomains;

  /// No description provided for @discover_noVideos.
  ///
  /// In en, this message translates to:
  /// **'No videos found.'**
  String get discover_noVideos;

  /// No description provided for @discover_quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get discover_quickActions;

  /// No description provided for @discover_trackedDomains.
  ///
  /// In en, this message translates to:
  /// **'Your Tracked Domains'**
  String get discover_trackedDomains;

  /// No description provided for @discover_trackingCount.
  ///
  /// In en, this message translates to:
  /// **'You are tracking {count} domains.'**
  String discover_trackingCount(Object count);

  /// No description provided for @discover_videoError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load videos.'**
  String get discover_videoError;

  /// No description provided for @discover_viewAllDomains.
  ///
  /// In en, this message translates to:
  /// **'View All Domains'**
  String get discover_viewAllDomains;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'By Continuing, You Acknowledge That You Have Read And Accept Our'**
  String get disclaimer;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @event.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get event;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get explore;

  /// No description provided for @favourites.
  ///
  /// In en, this message translates to:
  /// **'Favourites'**
  String get favourites;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @fun.
  ///
  /// In en, this message translates to:
  /// **'Fun'**
  String get fun;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @generatorWizard_checkingDomain.
  ///
  /// In en, this message translates to:
  /// **'Checking {domain}...'**
  String generatorWizard_checkingDomain(Object domain);

  /// No description provided for @generatorWizard_errorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String generatorWizard_errorPrefix(Object error);

  /// No description provided for @generatorWizard_generateButton.
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get generatorWizard_generateButton;

  /// No description provided for @generatorWizard_keywordHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. agriculture, fintech'**
  String get generatorWizard_keywordHint;

  /// No description provided for @generatorWizard_locationHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Nairobi'**
  String get generatorWizard_locationHint;

  /// No description provided for @generatorWizard_noSuggestions.
  ///
  /// In en, this message translates to:
  /// **'No suggestions yet. Generate to see results.'**
  String get generatorWizard_noSuggestions;

  /// No description provided for @generatorWizard_step1.
  ///
  /// In en, this message translates to:
  /// **'1. What is the domain for?'**
  String get generatorWizard_step1;

  /// No description provided for @generatorWizard_step2.
  ///
  /// In en, this message translates to:
  /// **'2. Preferred domain length:'**
  String get generatorWizard_step2;

  /// No description provided for @generatorWizard_step3.
  ///
  /// In en, this message translates to:
  /// **'3. Preferred style:'**
  String get generatorWizard_step3;

  /// No description provided for @generatorWizard_step4.
  ///
  /// In en, this message translates to:
  /// **'4. Location:'**
  String get generatorWizard_step4;

  /// No description provided for @generatorWizard_step5.
  ///
  /// In en, this message translates to:
  /// **'5. Keyword (idea):'**
  String get generatorWizard_step5;

  /// No description provided for @generatorWizard_step6.
  ///
  /// In en, this message translates to:
  /// **'6. Language:'**
  String get generatorWizard_step6;

  /// No description provided for @generatorWizard_suggestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get generatorWizard_suggestionsTitle;

  /// No description provided for @generatorWizard_title.
  ///
  /// In en, this message translates to:
  /// **'Domain Name Generator'**
  String get generatorWizard_title;

  /// No description provided for @getHelp.
  ///
  /// In en, this message translates to:
  /// **'Get Help'**
  String get getHelp;

  /// No description provided for @getTheApp.
  ///
  /// In en, this message translates to:
  /// **'Get The App'**
  String get getTheApp;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get goodEvening;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorning;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @inviteFriend.
  ///
  /// In en, this message translates to:
  /// **'Invite Friend'**
  String get inviteFriend;

  /// No description provided for @inviteFriends.
  ///
  /// In en, this message translates to:
  /// **'Invite Friends'**
  String get inviteFriends;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @long.
  ///
  /// In en, this message translates to:
  /// **'Long'**
  String get long;

  /// No description provided for @lookupScreen_title.
  ///
  /// In en, this message translates to:
  /// **'Domain Lookup'**
  String get lookupScreen_title;

  /// No description provided for @lookupScreen_enterDomain.
  ///
  /// In en, this message translates to:
  /// **'Enter Domain Name'**
  String get lookupScreen_enterDomain;

  /// No description provided for @lookupScreen_enterDomainHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. example.com'**
  String get lookupScreen_enterDomainHint;

  /// No description provided for @lookupScreen_checkButton.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get lookupScreen_checkButton;

  /// No description provided for @lookupScreen_available.
  ///
  /// In en, this message translates to:
  /// **'✅ Available to purchase'**
  String get lookupScreen_available;

  /// No description provided for @lookupScreen_registered.
  ///
  /// In en, this message translates to:
  /// **'❌ Already registered'**
  String get lookupScreen_registered;

  /// No description provided for @lookupScreen_created.
  ///
  /// In en, this message translates to:
  /// **'Created: {date}'**
  String lookupScreen_created(Object date);

  /// No description provided for @lookupScreen_updated.
  ///
  /// In en, this message translates to:
  /// **'Updated: {date}'**
  String lookupScreen_updated(Object date);

  /// No description provided for @lookupScreen_expires.
  ///
  /// In en, this message translates to:
  /// **'Expires: {date}'**
  String lookupScreen_expires(Object date);

  /// No description provided for @lookupScreen_status.
  ///
  /// In en, this message translates to:
  /// **'Status: {status}'**
  String lookupScreen_status(Object status);

  /// No description provided for @lookupScreen_nameServers.
  ///
  /// In en, this message translates to:
  /// **'Name Servers: {servers}'**
  String lookupScreen_nameServers(Object servers);

  /// No description provided for @lookupScreen_registrantInfo.
  ///
  /// In en, this message translates to:
  /// **'Registrant Info'**
  String get lookupScreen_registrantInfo;

  /// No description provided for @lookupScreen_registrantName.
  ///
  /// In en, this message translates to:
  /// **'Name: {name}'**
  String lookupScreen_registrantName(Object name);

  /// No description provided for @lookupScreen_registrantEmail.
  ///
  /// In en, this message translates to:
  /// **'Email: {email}'**
  String lookupScreen_registrantEmail(Object email);

  /// No description provided for @lookupScreen_registrantPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone: {phone}'**
  String lookupScreen_registrantPhone(Object phone);

  /// No description provided for @lookupScreen_registrantCountry.
  ///
  /// In en, this message translates to:
  /// **'Country: {country}'**
  String lookupScreen_registrantCountry(Object country);

  /// No description provided for @lookupScreen_registrarInfo.
  ///
  /// In en, this message translates to:
  /// **'Registrar'**
  String get lookupScreen_registrarInfo;

  /// No description provided for @lookupScreen_registrarName.
  ///
  /// In en, this message translates to:
  /// **'Name: {name}'**
  String lookupScreen_registrarName(Object name);

  /// No description provided for @lookupScreen_registrarEmail.
  ///
  /// In en, this message translates to:
  /// **'Email: {email}'**
  String lookupScreen_registrarEmail(Object email);

  /// No description provided for @lookupScreen_registrarPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone: {phone}'**
  String lookupScreen_registrarPhone(Object phone);

  /// No description provided for @lookupScreen_error.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String lookupScreen_error(Object error);

  /// No description provided for @lookupScreen_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get lookupScreen_loading;

  /// No description provided for @madeInKenya.
  ///
  /// In en, this message translates to:
  /// **'Made With ♥ In Kenya 🇰🇪'**
  String get madeInKenya;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @openSourceLicenses.
  ///
  /// In en, this message translates to:
  /// **'Open Source Licenses'**
  String get openSourceLicenses;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordResetEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent'**
  String get passwordResetEmailSent;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @professional.
  ///
  /// In en, this message translates to:
  /// **'Professional'**
  String get professional;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @registrarSelector_title.
  ///
  /// In en, this message translates to:
  /// **'Choose a Registrar'**
  String get registrarSelector_title;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @sendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get sendFeedback;

  /// No description provided for @sendResetEmail.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Email'**
  String get sendResetEmail;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Check Out The K3VO App Here'**
  String get shareApp;

  /// No description provided for @shareAppRecommendation.
  ///
  /// In en, this message translates to:
  /// **'K3VO App Recommendation'**
  String get shareAppRecommendation;

  /// No description provided for @short.
  ///
  /// In en, this message translates to:
  /// **'Short'**
  String get short;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Sign In With Apple'**
  String get signInWithApple;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign In With Google'**
  String get signInWithGoogle;

  /// No description provided for @signInWithPhone.
  ///
  /// In en, this message translates to:
  /// **'Sign In With Phone Number'**
  String get signInWithPhone;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @social.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get social;

  /// No description provided for @suggestionsList_checkButton.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get suggestionsList_checkButton;

  /// No description provided for @suggestionsList_status_available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get suggestionsList_status_available;

  /// No description provided for @suggestionsList_status_checking.
  ///
  /// In en, this message translates to:
  /// **'Checking...'**
  String get suggestionsList_status_checking;

  /// No description provided for @suggestionsList_status_error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get suggestionsList_status_error;

  /// No description provided for @suggestionsList_status_taken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get suggestionsList_status_taken;

  /// No description provided for @supportVisitHelpCentre.
  ///
  /// In en, this message translates to:
  /// **'Visit The Help Centre'**
  String get supportVisitHelpCentre;

  /// No description provided for @swahili.
  ///
  /// In en, this message translates to:
  /// **'Swahili'**
  String get swahili;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @visitWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit Website'**
  String get visitWebsite;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr', 'sw'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
    case 'sw': return AppLocalizationsSw();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
