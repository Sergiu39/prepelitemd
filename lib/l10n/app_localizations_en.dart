// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'prepeliteMD';

  @override
  String get navDashboard => 'Dashboard';

  @override
  String get navSettings => 'Settings';

  @override
  String get speciesQuail => 'Quail';

  @override
  String get speciesChicken => 'Chickens';

  @override
  String get speciesRabbit => 'Rabbits';

  @override
  String get purposeEggs => 'Eggs';

  @override
  String get purposeMeat => 'Meat';

  @override
  String get purposeBreeding => 'Breeding';

  @override
  String get dashboardEggsToday => 'Eggs today';

  @override
  String get dashboardEggsWeek => 'Eggs, last 7 days';

  @override
  String get dashboardAliveAnimals => 'Live animals';

  @override
  String activeFlocks(int count) {
    return 'Active flocks: $count';
  }

  @override
  String get flocksEmpty => 'No flocks yet';

  @override
  String get addFlock => 'Add flock';

  @override
  String ageDays(int days) {
    return 'Age: $days d';
  }

  @override
  String eggsTodayCount(int count) {
    return 'Eggs today: $count';
  }

  @override
  String get flockNotFound => 'Flock not found';

  @override
  String get fieldSpecies => 'Species';

  @override
  String get fieldPurpose => 'Purpose';

  @override
  String get fieldStartDate => 'Start date';

  @override
  String get fieldAge => 'Age';

  @override
  String get fieldInitialCount => 'Initial count';

  @override
  String get fieldDeaths => 'Deaths';

  @override
  String get fieldSold => 'Sold';

  @override
  String get fieldCurrentCount => 'Current count';

  @override
  String get sectionFeed => 'Feed';

  @override
  String get sectionHealth => 'Health';

  @override
  String get sectionProduction => 'Production';

  @override
  String get sectionMoney => 'Money';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get languageSystem => 'Phone language';

  @override
  String get demoDataBanner => 'Sample data: nothing is saved yet.';

  @override
  String daysValue(int days) {
    return '$days days';
  }
}
