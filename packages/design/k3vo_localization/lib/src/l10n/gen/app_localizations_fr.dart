// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get about => 'À propos';

  @override
  String get aboutK3vo => 'À propos de K3VO';

  @override
  String get aboutTheDeveloper => 'À propos du développeur';

  @override
  String get account => 'Compte';

  @override
  String get allRightsReserved => 'Tous droits réservés.';

  @override
  String get and => 'Et';

  @override
  String get appearance => 'Apparence';

  @override
  String get appAuthor => 'Kevin Omyonga';

  @override
  String get appAuthorAlias => 'Dr. KNO';

  @override
  String get appAuthorRole => 'Architecte logiciel, ingénieur et designer';

  @override
  String get appCompanyName => 'KNOEYES';

  @override
  String get appName => 'K3VO';

  @override
  String get appPoweredBy => 'Propulsé par';

  @override
  String get appTagline => 'Accès. Connexion. Propriété';

  @override
  String get bookings => 'Réservations';

  @override
  String get business => 'Entreprise';

  @override
  String get confirmPassword => 'Confirmez le mot de passe';

  @override
  String get creative => 'Créatif';

  @override
  String get dangerZone => 'Zone dangereuse';

  @override
  String get deactivateAccount => 'Désactiver le compte';

  @override
  String discover_expiringSoon(Object count, Object days) {
    return '$count domaines expirant dans les $days prochains jours.';
  }

  @override
  String get discover_generateNames => 'Générer des noms';

  @override
  String get discover_latestFromKenic => 'Dernières nouvelles de KeNIC';

  @override
  String get discover_lookupDomains => 'Rechercher des domaines';

  @override
  String get discover_noVideos => 'Aucune vidéo trouvée.';

  @override
  String get discover_quickActions => 'Actions rapides';

  @override
  String get discover_trackedDomains => 'Vos domaines suivis';

  @override
  String discover_trackingCount(Object count) {
    return 'Vous suivez $count domaines.';
  }

  @override
  String get discover_videoError => 'Échec du chargement des vidéos.';

  @override
  String get discover_viewAllDomains => 'Voir tous les domaines';

  @override
  String get disclaimer => 'En continuant, vous reconnaissez avoir lu et accepté nos';

  @override
  String get email => 'Email';

  @override
  String get english => 'Anglais';

  @override
  String get enterYourEmail => 'Entrez votre email';

  @override
  String get event => 'Événement';

  @override
  String get explore => 'Découvrir';

  @override
  String get favourites => 'Favoris';

  @override
  String get forgotPassword => 'Mot de passe oublié';

  @override
  String get fun => 'Amusant';

  @override
  String get french => 'Français';

  @override
  String generatorWizard_checkingDomain(Object domain) {
    return 'Vérification de $domain...';
  }

  @override
  String generatorWizard_errorPrefix(Object error) {
    return 'Erreur : $error';
  }

  @override
  String get generatorWizard_generateButton => 'Générer';

  @override
  String get generatorWizard_keywordHint => 'ex. agriculture, fintech';

  @override
  String get generatorWizard_locationHint => 'ex. Nairobi';

  @override
  String get generatorWizard_noSuggestions => 'Aucune suggestion pour le moment. Cliquez sur Générer pour voir les résultats.';

  @override
  String get generatorWizard_step1 => '1. À quoi servira le domaine ?';

  @override
  String get generatorWizard_step2 => '2. Longueur de domaine préférée :';

  @override
  String get generatorWizard_step3 => '3. Style préféré :';

  @override
  String get generatorWizard_step4 => '4. Localisation :';

  @override
  String get generatorWizard_step5 => '5. Mot-clé (idée) :';

  @override
  String get generatorWizard_step6 => '6. Langue :';

  @override
  String get generatorWizard_suggestionsTitle => 'Suggestions';

  @override
  String get generatorWizard_title => 'Générateur de noms de domaine';

  @override
  String get getHelp => 'Obtenir de l\'aide';

  @override
  String get getTheApp => 'Télécharger l\'application';

  @override
  String get goodAfternoon => 'Bon après-midi';

  @override
  String get goodEvening => 'Bonsoir';

  @override
  String get goodMorning => 'Bonjour';

  @override
  String get home => 'Accueil';

  @override
  String get inviteFriend => 'Inviter un ami';

  @override
  String get inviteFriends => 'Inviter des amis';

  @override
  String get language => 'Langue';

  @override
  String get legal => 'Mentions légales';

  @override
  String get login => 'Connexion';

  @override
  String get logout => 'Déconnexion';

  @override
  String get long => 'Long';

  @override
  String get lookupScreen_title => 'Recherche de domaine';

  @override
  String get lookupScreen_enterDomain => 'Entrez le nom de domaine';

  @override
  String get lookupScreen_enterDomainHint => 'ex. example.com';

  @override
  String get lookupScreen_checkButton => 'Vérifier';

  @override
  String get lookupScreen_available => '✅ Disponible à l\'achat';

  @override
  String get lookupScreen_registered => '❌ Déjà enregistré';

  @override
  String lookupScreen_created(Object date) {
    return 'Créé: $date';
  }

  @override
  String lookupScreen_updated(Object date) {
    return 'Mis à jour: $date';
  }

  @override
  String lookupScreen_expires(Object date) {
    return 'Expire: $date';
  }

  @override
  String lookupScreen_status(Object status) {
    return 'Statut: $status';
  }

  @override
  String lookupScreen_nameServers(Object servers) {
    return 'Serveurs de noms: $servers';
  }

  @override
  String get lookupScreen_registrantInfo => 'Informations sur le titulaire';

  @override
  String lookupScreen_registrantName(Object name) {
    return 'Nom: $name';
  }

  @override
  String lookupScreen_registrantEmail(Object email) {
    return 'Email: $email';
  }

  @override
  String lookupScreen_registrantPhone(Object phone) {
    return 'Téléphone: $phone';
  }

  @override
  String lookupScreen_registrantCountry(Object country) {
    return 'Pays: $country';
  }

  @override
  String get lookupScreen_registrarInfo => 'Registraire';

  @override
  String lookupScreen_registrarName(Object name) {
    return 'Nom: $name';
  }

  @override
  String lookupScreen_registrarEmail(Object email) {
    return 'Email: $email';
  }

  @override
  String lookupScreen_registrarPhone(Object phone) {
    return 'Téléphone: $phone';
  }

  @override
  String lookupScreen_error(Object error) {
    return 'Erreur: $error';
  }

  @override
  String get lookupScreen_loading => 'Chargement...';

  @override
  String get madeInKenya => 'Fabriqué avec ♥ au Kenya 🇰🇪';

  @override
  String get medium => 'Moyen';

  @override
  String get messages => 'Messages';

  @override
  String get more => 'Plus';

  @override
  String get notifications => 'Notifications';

  @override
  String get openSourceLicenses => 'Licences open source';

  @override
  String get or => 'OU';

  @override
  String get other => 'Autre';

  @override
  String get password => 'Mot de passe';

  @override
  String get passwordResetEmailSent => 'E-mail de réinitialisation du mot de passe envoyé';

  @override
  String get passwordsDoNotMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get personal => 'Personnel';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get professional => 'Professionnel';

  @override
  String get register => 'S\'inscrire';

  @override
  String get registrarSelector_title => 'Choisissez un registraire';

  @override
  String get reviews => 'Avis';

  @override
  String get sendFeedback => 'Envoyer des commentaires';

  @override
  String get sendResetEmail => 'Envoyer l\'e-mail de réinitialisation';

  @override
  String get settings => 'Paramètres';

  @override
  String get share => 'Partager';

  @override
  String get shareApp => 'Découvrez l\'application K3VO ici';

  @override
  String get shareAppRecommendation => 'Recommandation de l\'application K3VO';

  @override
  String get short => 'Court';

  @override
  String get signIn => 'Se connecter';

  @override
  String get signInWithApple => 'Se connecter avec Apple';

  @override
  String get signInWithGoogle => 'Se connecter avec Google';

  @override
  String get signInWithPhone => 'Se connecter avec un numéro de téléphone';

  @override
  String get signUp => 'Créer un compte';

  @override
  String get social => 'Social';

  @override
  String get suggestionsList_checkButton => 'Vérifier';

  @override
  String get suggestionsList_status_available => 'Disponible';

  @override
  String get suggestionsList_status_checking => 'Vérification...';

  @override
  String get suggestionsList_status_error => 'Erreur';

  @override
  String get suggestionsList_status_taken => 'Pris';

  @override
  String get supportVisitHelpCentre => 'Visiter le centre d\'aide';

  @override
  String get swahili => 'Swahili';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get theme => 'Thème';

  @override
  String get visitWebsite => 'Visiter le site web';
}
