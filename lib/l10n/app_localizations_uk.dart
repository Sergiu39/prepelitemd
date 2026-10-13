// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'prepeliteMD';

  @override
  String get navDashboard => 'Головна';

  @override
  String get navSettings => 'Налаштування';

  @override
  String get speciesQuail => 'Перепілки';

  @override
  String get speciesChicken => 'Кури';

  @override
  String get speciesRabbit => 'Кролі';

  @override
  String get purposeEggs => 'Яйця';

  @override
  String get purposeMeat => 'М\'ясо';

  @override
  String get purposeBreeding => 'Розведення';

  @override
  String get dashboardEggsToday => 'Яєць сьогодні';

  @override
  String get dashboardEggsWeek => 'Яєць за 7 днів';

  @override
  String get dashboardAliveAnimals => 'Живі тварини';

  @override
  String activeFlocks(int count) {
    return 'Активні групи: $count';
  }

  @override
  String get flocksEmpty => 'Груп поки немає';

  @override
  String get addFlock => 'Додати групу';

  @override
  String ageDays(int days) {
    return 'Вік: $days дн.';
  }

  @override
  String eggsTodayCount(int count) {
    return 'Яєць сьогодні: $count';
  }

  @override
  String get flockNotFound => 'Групу не знайдено';

  @override
  String get fieldSpecies => 'Вид';

  @override
  String get fieldPurpose => 'Призначення';

  @override
  String get fieldStartDate => 'Дата надходження';

  @override
  String get fieldAge => 'Вік';

  @override
  String get fieldInitialCount => 'Початкова кількість';

  @override
  String get fieldDeaths => 'Падіж';

  @override
  String get fieldSold => 'Продано';

  @override
  String get fieldCurrentCount => 'Поточна кількість';

  @override
  String get sectionFeed => 'Корми';

  @override
  String get sectionHealth => 'Здоров\'я';

  @override
  String get sectionProduction => 'Продукція';

  @override
  String get sectionMoney => 'Фінанси';

  @override
  String get comingSoon => 'Незабаром';

  @override
  String get settingsLanguage => 'Мова';

  @override
  String get languageSystem => 'Мова телефону';

  @override
  String get demoDataBanner => 'Демо-дані: поки нічого не зберігається.';

  @override
  String daysValue(int days) {
    return '$days дн.';
  }
}
