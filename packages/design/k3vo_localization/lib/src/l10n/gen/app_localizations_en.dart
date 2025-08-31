// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get about => 'About';

  @override
  String get aboutK3vo => 'About K3VO';

  @override
  String get aboutTheDeveloper => 'About The Developer';

  @override
  String get account => 'Account';

  @override
  String get allRightsReserved => 'All Rights Reserved.';

  @override
  String get and => 'And';

  @override
  String get appearance => 'Appearance';

  @override
  String get appAuthor => 'Kevin Omyonga';

  @override
  String get appAuthorAlias => 'Dr. KNO';

  @override
  String get appAuthorRole => 'Software Architect, Engineer & Designer';

  @override
  String get appCompanyName => 'KNOEYES';

  @override
  String get appName => 'K3VO';

  @override
  String get appPoweredBy => 'Powered By';

  @override
  String get appTagline => 'Access. Connection. Ownership';

  @override
  String get bookings => 'Bookings';

  @override
  String get business => 'Business';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get creative => 'Creative';

  @override
  String get dangerZone => 'Danger Zone';

  @override
  String get deactivateAccount => 'Deactivate Account';

  @override
  String discover_expiringSoon(Object count, Object days) {
    return '$count domains expiring in the next $days days.';
  }

  @override
  String get discover_generateNames => 'Generate Names';

  @override
  String get discover_latestFromKenic => 'Latest from KeNIC';

  @override
  String get discover_lookupDomains => 'Lookup Domains';

  @override
  String get discover_noVideos => 'No videos found.';

  @override
  String get discover_quickActions => 'Quick Actions';

  @override
  String get discover_trackedDomains => 'Your Tracked Domains';

  @override
  String discover_trackingCount(Object count) {
    return 'You are tracking $count domains.';
  }

  @override
  String get discover_videoError => 'Failed to load videos.';

  @override
  String get discover_viewAllDomains => 'View All Domains';

  @override
  String get disclaimer => 'By Continuing, You Acknowledge That You Have Read And Accept Our';

  @override
  String get email => 'Email';

  @override
  String get english => 'English';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get event => 'Event';

  @override
  String get explore => 'Discover';

  @override
  String get favourites => 'Favourites';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get fun => 'Fun';

  @override
  String get french => 'French';

  @override
  String generatorWizard_checkingDomain(Object domain) {
    return 'Checking $domain...';
  }

  @override
  String generatorWizard_errorPrefix(Object error) {
    return 'Error: $error';
  }

  @override
  String get generatorWizard_generateButton => 'Generate';

  @override
  String get generatorWizard_keywordHint => 'e.g. agriculture, fintech';

  @override
  String get generatorWizard_locationHint => 'e.g. Nairobi';

  @override
  String get generatorWizard_noSuggestions => 'No suggestions yet. Generate to see results.';

  @override
  String get generatorWizard_step1 => '1. What is the domain for?';

  @override
  String get generatorWizard_step2 => '2. Preferred domain length:';

  @override
  String get generatorWizard_step3 => '3. Preferred style:';

  @override
  String get generatorWizard_step4 => '4. Location:';

  @override
  String get generatorWizard_step5 => '5. Keyword (idea):';

  @override
  String get generatorWizard_step6 => '6. Language:';

  @override
  String get generatorWizard_suggestionsTitle => 'Suggestions';

  @override
  String get generatorWizard_title => 'Domain Name Generator';

  @override
  String get getHelp => 'Get Help';

  @override
  String get getTheApp => 'Get The App';

  @override
  String get goodAfternoon => 'Good Afternoon';

  @override
  String get goodEvening => 'Good Evening';

  @override
  String get goodMorning => 'Good Morning';

  @override
  String get home => 'Home';

  @override
  String get inviteFriend => 'Invite Friend';

  @override
  String get inviteFriends => 'Invite Friends';

  @override
  String get language => 'Language';

  @override
  String get legal => 'Legal';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get long => 'Long';

  @override
  String get lookupScreen_title => 'Domain Lookup';

  @override
  String get lookupScreen_enterDomain => 'Enter Domain Name';

  @override
  String get lookupScreen_enterDomainHint => 'e.g. example.com';

  @override
  String get lookupScreen_checkButton => 'Check';

  @override
  String get lookupScreen_available => '✅ Available to purchase';

  @override
  String get lookupScreen_registered => '❌ Already registered';

  @override
  String lookupScreen_created(Object date) {
    return 'Created: $date';
  }

  @override
  String lookupScreen_updated(Object date) {
    return 'Updated: $date';
  }

  @override
  String lookupScreen_expires(Object date) {
    return 'Expires: $date';
  }

  @override
  String lookupScreen_status(Object status) {
    return 'Status: $status';
  }

  @override
  String lookupScreen_nameServers(Object servers) {
    return 'Name Servers: $servers';
  }

  @override
  String get lookupScreen_registrantInfo => 'Registrant Info';

  @override
  String lookupScreen_registrantName(Object name) {
    return 'Name: $name';
  }

  @override
  String lookupScreen_registrantEmail(Object email) {
    return 'Email: $email';
  }

  @override
  String lookupScreen_registrantPhone(Object phone) {
    return 'Phone: $phone';
  }

  @override
  String lookupScreen_registrantCountry(Object country) {
    return 'Country: $country';
  }

  @override
  String get lookupScreen_registrarInfo => 'Registrar';

  @override
  String lookupScreen_registrarName(Object name) {
    return 'Name: $name';
  }

  @override
  String lookupScreen_registrarEmail(Object email) {
    return 'Email: $email';
  }

  @override
  String lookupScreen_registrarPhone(Object phone) {
    return 'Phone: $phone';
  }

  @override
  String lookupScreen_error(Object error) {
    return 'Error: $error';
  }

  @override
  String get lookupScreen_loading => 'Loading...';

  @override
  String get madeInKenya => 'Made With ♥ In Kenya 🇰🇪';

  @override
  String get medium => 'Medium';

  @override
  String get messages => 'Messages';

  @override
  String get more => 'More';

  @override
  String get notifications => 'Notifications';

  @override
  String get openSourceLicenses => 'Open Source Licenses';

  @override
  String get or => 'OR';

  @override
  String get other => 'Other';

  @override
  String get password => 'Password';

  @override
  String get passwordResetEmailSent => 'Password reset email sent';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get personal => 'Personal';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get professional => 'Professional';

  @override
  String get register => 'Register';

  @override
  String get registrarSelector_title => 'Choose a Registrar';

  @override
  String get reviews => 'Reviews';

  @override
  String get sendFeedback => 'Send Feedback';

  @override
  String get sendResetEmail => 'Send Reset Email';

  @override
  String get settings => 'Settings';

  @override
  String get share => 'Share';

  @override
  String get shareApp => 'Check Out The K3VO App Here';

  @override
  String get shareAppRecommendation => 'K3VO App Recommendation';

  @override
  String get short => 'Short';

  @override
  String get signIn => 'Sign In';

  @override
  String get signInWithApple => 'Sign In With Apple';

  @override
  String get signInWithGoogle => 'Sign In With Google';

  @override
  String get signInWithPhone => 'Sign In With Phone Number';

  @override
  String get signUp => 'Sign Up';

  @override
  String get social => 'Social';

  @override
  String get suggestionsList_checkButton => 'Check';

  @override
  String get suggestionsList_status_available => 'Available';

  @override
  String get suggestionsList_status_checking => 'Checking...';

  @override
  String get suggestionsList_status_error => 'Error';

  @override
  String get suggestionsList_status_taken => 'Taken';

  @override
  String get supportVisitHelpCentre => 'Visit The Help Centre';

  @override
  String get swahili => 'Swahili';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get theme => 'Theme';

  @override
  String get visitWebsite => 'Visit Website';

  @override
  String get domainsScreen_deleteTitle => 'Delete Domain';

  @override
  String domainsScreen_deleteConfirm(Object domain) {
    return 'Are you sure you want to delete $domain?';
  }

  @override
  String domainsScreen_deleted(Object domain) {
    return 'Deleted $domain';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get domainsScreen_title => 'Saved Domains';

  @override
  String get domainsScreen_empty => 'No domains saved yet';

  @override
  String suggestionsList_savedToDomains(Object domain) {
    return 'Saved $domain to Domains';
  }
}
