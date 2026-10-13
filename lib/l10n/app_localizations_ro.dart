// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'prepeliteMD';

  @override
  String get navDashboard => 'Panou';

  @override
  String get navSettings => 'Setări';

  @override
  String get speciesQuail => 'Prepelițe';

  @override
  String get speciesChicken => 'Găini';

  @override
  String get speciesRabbit => 'Iepuri';

  @override
  String get purposeEggs => 'Ouă';

  @override
  String get purposeMeat => 'Carne';

  @override
  String get purposeBreeding => 'Reproducție';

  @override
  String get dashboardEggsToday => 'Ouă azi';

  @override
  String get dashboardEggsWeek => 'Ouă, ultimele 7 zile';

  @override
  String get dashboardAliveAnimals => 'Animale vii';

  @override
  String activeFlocks(int count) {
    return 'Loturi active: $count';
  }

  @override
  String get flocksEmpty => 'Niciun lot încă';

  @override
  String get addFlock => 'Adaugă lot';

  @override
  String ageDays(int days) {
    return 'Vârsta: $days z';
  }

  @override
  String eggsTodayCount(int count) {
    return 'Ouă azi: $count';
  }

  @override
  String get flockNotFound => 'Lotul nu a fost găsit';

  @override
  String get fieldSpecies => 'Specie';

  @override
  String get fieldPurpose => 'Scop';

  @override
  String get fieldStartDate => 'Data intrării';

  @override
  String get fieldAge => 'Vârsta';

  @override
  String get fieldInitialCount => 'Număr inițial';

  @override
  String get fieldDeaths => 'Morți';

  @override
  String get fieldSold => 'Vânduți';

  @override
  String get fieldCurrentCount => 'Număr actual';

  @override
  String get sectionFeed => 'Hrană';

  @override
  String get sectionHealth => 'Sănătate';

  @override
  String get sectionProduction => 'Producție';

  @override
  String get sectionMoney => 'Bani';

  @override
  String get comingSoon => 'În curând';

  @override
  String get settingsLanguage => 'Limba';

  @override
  String get languageSystem => 'Limba telefonului';

  @override
  String get demoDataBanner => 'Date de probă: nimic nu se salvează încă.';

  @override
  String daysValue(int days) {
    return '$days zile';
  }

  @override
  String get welcomeSubtitle => 'Ferma ta, în buzunar';

  @override
  String get chooseLanguage => 'Alege limba';

  @override
  String get chooseGroup => 'Ce crești?';

  @override
  String get groupBirds => 'Păsări';

  @override
  String get groupAnimals => 'Animale';

  @override
  String get groupBirdsHint => 'Prepelițe, găini';

  @override
  String get groupAnimalsHint => 'Iepuri';

  @override
  String get chooseSpecies => 'Ce vrei să administrezi?';

  @override
  String get settingsStartPage => 'Pagina de start';
}
