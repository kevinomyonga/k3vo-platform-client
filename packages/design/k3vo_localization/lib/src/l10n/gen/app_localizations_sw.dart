// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get about => 'Kuhusu';

  @override
  String get aboutK3vo => 'Kuhusu K3VO';

  @override
  String get aboutTheDeveloper => 'Kuhusu Msanidi';

  @override
  String get account => 'Akaunti';

  @override
  String get allRightsReserved => 'Haki zote zimehifadhiwa.';

  @override
  String get and => 'Na';

  @override
  String get appearance => 'Mwonekano';

  @override
  String get appAuthor => 'Kevin Omyonga';

  @override
  String get appAuthorAlias => 'Dkt. KNO';

  @override
  String get appAuthorRole => 'Mbunifu wa Programu, Mhandisi na Mbunifu';

  @override
  String get appCompanyName => 'KNOEYES';

  @override
  String get appName => 'K3VO';

  @override
  String get appPoweredBy => 'Imeendeshwa na';

  @override
  String get appTagline => 'Ufikiaji. Muunganisho. Umiliki';

  @override
  String get bookings => 'Oda';

  @override
  String get business => 'Biashara';

  @override
  String get confirmPassword => 'Thibitisha Nenosiri';

  @override
  String get creative => 'Bunifu';

  @override
  String get dangerZone => 'Eneo Hatari';

  @override
  String get deactivateAccount => 'Futa Akaunti';

  @override
  String discover_expiringSoon(Object count, Object days) {
    return 'Sehemu $count zinaisha ndani ya siku $days zijazo.';
  }

  @override
  String get discover_generateNames => 'Tengeneza Majina';

  @override
  String get discover_latestFromKenic => 'Habari za hivi punde kutoka KeNIC';

  @override
  String get discover_lookupDomains => 'Tafuta Sehemu';

  @override
  String get discover_noVideos => 'Hakuna video zilizopatikana.';

  @override
  String get discover_quickActions => 'Vitendo vya Haraka';

  @override
  String get discover_trackedDomains => 'Sehemu Zako Unazofuatilia';

  @override
  String discover_trackingCount(Object count) {
    return 'Unafuatilia sehemu $count.';
  }

  @override
  String get discover_videoError => 'Imeshindwa kupakia video.';

  @override
  String get discover_viewAllDomains => 'Tazama Sehemu Zote';

  @override
  String get disclaimer => 'Kwa kuendelea, unakubali kuwa umesoma na kukubali yetu';

  @override
  String get email => 'Barua pepe';

  @override
  String get english => 'Kiingereza';

  @override
  String get enterYourEmail => 'Weka barua pepe yako';

  @override
  String get event => 'Tukio';

  @override
  String get explore => 'Gundua';

  @override
  String get favourites => 'Vipendwa';

  @override
  String get forgotPassword => 'Umesahau Nenosiri';

  @override
  String get fun => 'Burudani';

  @override
  String get french => 'Kifaransa';

  @override
  String generatorWizard_checkingDomain(Object domain) {
    return 'Inakagua $domain...';
  }

  @override
  String generatorWizard_errorPrefix(Object error) {
    return 'Hitilafu: $error';
  }

  @override
  String get generatorWizard_generateButton => 'Tengeneza';

  @override
  String get generatorWizard_keywordHint => 'mf. kilimo, fintech';

  @override
  String get generatorWizard_locationHint => 'mf. Nairobi';

  @override
  String get generatorWizard_noSuggestions => 'Hakuna mapendekezo bado. Bonyeza Tengeneza kuona matokeo.';

  @override
  String get generatorWizard_step1 => '1. Sehemu ni ya nini?';

  @override
  String get generatorWizard_step2 => '2. Urefu wa sehemu unaopendelea:';

  @override
  String get generatorWizard_step3 => '3. Mtindo unaopendelea:';

  @override
  String get generatorWizard_step4 => '4. Mahali:';

  @override
  String get generatorWizard_step5 => '5. Neno kuu (wazo):';

  @override
  String get generatorWizard_step6 => '6. Lugha:';

  @override
  String get generatorWizard_suggestionsTitle => 'Mapendekezo';

  @override
  String get generatorWizard_title => 'Kizalishaji cha Majina ya Sehemu';

  @override
  String get getHelp => 'Pata Msaada';

  @override
  String get getTheApp => 'Pata Programu';

  @override
  String get goodAfternoon => 'Mchana Mwema';

  @override
  String get goodEvening => 'Jioni Njema';

  @override
  String get goodMorning => 'Habari za Asubuhi';

  @override
  String get home => 'Nyumbani';

  @override
  String get inviteFriend => 'Alika Rafiki';

  @override
  String get inviteFriends => 'Alika Marafiki';

  @override
  String get language => 'Lugha';

  @override
  String get legal => 'Kisheria';

  @override
  String get login => 'Ingia';

  @override
  String get logout => 'Ondoka';

  @override
  String get long => 'Refu';

  @override
  String get lookupScreen_title => 'Angalia Sehemu';

  @override
  String get lookupScreen_enterDomain => 'Weka Jina la Sehemu';

  @override
  String get lookupScreen_enterDomainHint => 'mf. example.com';

  @override
  String get lookupScreen_checkButton => 'Angalia';

  @override
  String get lookupScreen_available => '✅ Inapatikana kununuliwa';

  @override
  String get lookupScreen_registered => '❌ Tayari imesajiliwa';

  @override
  String lookupScreen_created(Object date) {
    return 'Iliundwa: $date';
  }

  @override
  String lookupScreen_updated(Object date) {
    return 'Imeboreshwa: $date';
  }

  @override
  String lookupScreen_expires(Object date) {
    return 'Inaisha: $date';
  }

  @override
  String lookupScreen_status(Object status) {
    return 'Hali: $status';
  }

  @override
  String lookupScreen_nameServers(Object servers) {
    return 'Majina ya seva: $servers';
  }

  @override
  String get lookupScreen_registrantInfo => 'Taarifa za Mmiliki';

  @override
  String lookupScreen_registrantName(Object name) {
    return 'Jina: $name';
  }

  @override
  String lookupScreen_registrantEmail(Object email) {
    return 'Barua pepe: $email';
  }

  @override
  String lookupScreen_registrantPhone(Object phone) {
    return 'Simu: $phone';
  }

  @override
  String lookupScreen_registrantCountry(Object country) {
    return 'Nchi: $country';
  }

  @override
  String get lookupScreen_registrarInfo => 'Regista';

  @override
  String lookupScreen_registrarName(Object name) {
    return 'Jina: $name';
  }

  @override
  String lookupScreen_registrarEmail(Object email) {
    return 'Barua pepe: $email';
  }

  @override
  String lookupScreen_registrarPhone(Object phone) {
    return 'Simu: $phone';
  }

  @override
  String lookupScreen_error(Object error) {
    return 'Hitilafu: $error';
  }

  @override
  String get lookupScreen_loading => 'Inapakia...';

  @override
  String get madeInKenya => 'Imetengenezwa kwa ♥ Kenya 🇰🇪';

  @override
  String get medium => 'Kati';

  @override
  String get messages => 'Ujumbe';

  @override
  String get more => 'Zaidi';

  @override
  String get notifications => 'Arifa';

  @override
  String get openSourceLicenses => 'Leseni Huria';

  @override
  String get or => 'AU';

  @override
  String get other => 'Nyingine';

  @override
  String get password => 'Nenosiri';

  @override
  String get passwordResetEmailSent => 'Barua pepe ya kuweka upya nenosiri imetumwa';

  @override
  String get passwordsDoNotMatch => 'Manenosiri hayalingani';

  @override
  String get personal => 'Binafsi';

  @override
  String get privacyPolicy => 'Sera ya Faragha';

  @override
  String get professional => 'Kitaalamu';

  @override
  String get register => 'Jisajili';

  @override
  String get reviews => 'Mapitio';

  @override
  String get sendFeedback => 'Tuma Maoni';

  @override
  String get sendResetEmail => 'Tuma Barua ya Kuweka Upya';

  @override
  String get settings => 'Mipangilio';

  @override
  String get share => 'Shiriki';

  @override
  String get shareApp => 'Angalia Programu ya K3VO hapa';

  @override
  String get shareAppRecommendation => 'Mapendekezo ya Programu ya K3VO';

  @override
  String get short => 'Fupi';

  @override
  String get signIn => 'Ingia';

  @override
  String get signInWithApple => 'Ingia kwa kutumia Apple';

  @override
  String get signInWithGoogle => 'Ingia kwa kutumia Google';

  @override
  String get signInWithPhone => 'Ingia kwa kutumia Namba ya Simu';

  @override
  String get signUp => 'Jisajili';

  @override
  String get social => 'Kijamii';

  @override
  String get suggestionsList_checkButton => 'Kagua';

  @override
  String get suggestionsList_status_available => 'Inapatikana';

  @override
  String get suggestionsList_status_checking => 'Inakagua...';

  @override
  String get suggestionsList_status_error => 'Hitilafu';

  @override
  String get suggestionsList_status_taken => 'Imeshachukuliwa';

  @override
  String get supportVisitHelpCentre => 'Tembelea Kituo cha Msaada';

  @override
  String get swahili => 'Kiswahili';

  @override
  String get termsOfService => 'Masharti ya Huduma';

  @override
  String get theme => 'Mandhari';

  @override
  String get visitWebsite => 'Tembelea Tovuti';
}
