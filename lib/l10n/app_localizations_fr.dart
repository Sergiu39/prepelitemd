// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'prepeliteMD';

  @override
  String get navDashboard => 'Accueil';

  @override
  String get navSettings => 'Paramètres';

  @override
  String get speciesQuail => 'Cailles';

  @override
  String get speciesChicken => 'Poules';

  @override
  String get speciesRabbit => 'Lapins';

  @override
  String get purposeEggs => 'Œufs';

  @override
  String get purposeMeat => 'Viande';

  @override
  String get purposeBreeding => 'Reproduction';

  @override
  String get dashboardEggsToday => 'Œufs aujourd\'hui';

  @override
  String get dashboardEggsWeek => 'Œufs, 7 derniers jours';

  @override
  String get dashboardAliveAnimals => 'Animaux vivants';

  @override
  String activeFlocks(int count) {
    return 'Lots actifs : $count';
  }

  @override
  String get flocksEmpty => 'Aucun lot pour l\'instant';

  @override
  String get addFlock => 'Ajouter un lot';

  @override
  String ageDays(int days) {
    return 'Âge : $days j';
  }

  @override
  String eggsTodayCount(int count) {
    return 'Œufs aujourd\'hui : $count';
  }

  @override
  String get flockNotFound => 'Lot introuvable';

  @override
  String get fieldSpecies => 'Espèce';

  @override
  String get fieldPurpose => 'Objectif';

  @override
  String get fieldStartDate => 'Date d\'entrée';

  @override
  String get fieldAge => 'Âge';

  @override
  String get fieldInitialCount => 'Effectif initial';

  @override
  String get fieldDeaths => 'Morts';

  @override
  String get fieldSold => 'Vendus';

  @override
  String get fieldCurrentCount => 'Effectif actuel';

  @override
  String get sectionFeed => 'Alimentation';

  @override
  String get sectionHealth => 'Santé';

  @override
  String get sectionProduction => 'Production';

  @override
  String get sectionMoney => 'Argent';

  @override
  String get comingSoon => 'Bientôt disponible';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get languageSystem => 'Langue du téléphone';

  @override
  String get demoDataBanner =>
      'Données d\'exemple : rien n\'est encore enregistré.';

  @override
  String daysValue(int days) {
    return '$days jours';
  }

  @override
  String get welcomeSubtitle => 'Votre ferme dans votre poche';

  @override
  String get chooseLanguage => 'Choisissez votre langue';

  @override
  String get chooseGroup => 'Qu\'élevez-vous ?';

  @override
  String get groupBirds => 'Oiseaux';

  @override
  String get groupAnimals => 'Animaux';

  @override
  String get groupBirdsHint => 'Cailles, poules';

  @override
  String get groupAnimalsHint => 'Lapins';

  @override
  String get chooseSpecies => 'Que voulez-vous gérer ?';

  @override
  String get settingsStartPage => 'Page d\'accueil';
}
