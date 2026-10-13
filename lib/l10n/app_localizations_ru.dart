// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'prepeliteMD';

  @override
  String get navDashboard => 'Главная';

  @override
  String get navSettings => 'Настройки';

  @override
  String get speciesQuail => 'Перепела';

  @override
  String get speciesChicken => 'Куры';

  @override
  String get speciesRabbit => 'Кролики';

  @override
  String get purposeEggs => 'Яйца';

  @override
  String get purposeMeat => 'Мясо';

  @override
  String get purposeBreeding => 'Разведение';

  @override
  String get dashboardEggsToday => 'Яиц сегодня';

  @override
  String get dashboardEggsWeek => 'Яиц за 7 дней';

  @override
  String get dashboardAliveAnimals => 'Живые животные';

  @override
  String activeFlocks(int count) {
    return 'Активные группы: $count';
  }

  @override
  String get flocksEmpty => 'Групп пока нет';

  @override
  String get addFlock => 'Добавить группу';

  @override
  String ageDays(int days) {
    return 'Возраст: $days дн.';
  }

  @override
  String eggsTodayCount(int count) {
    return 'Яиц сегодня: $count';
  }

  @override
  String get flockNotFound => 'Группа не найдена';

  @override
  String get fieldSpecies => 'Вид';

  @override
  String get fieldPurpose => 'Назначение';

  @override
  String get fieldStartDate => 'Дата поступления';

  @override
  String get fieldAge => 'Возраст';

  @override
  String get fieldInitialCount => 'Начальное количество';

  @override
  String get fieldDeaths => 'Падёж';

  @override
  String get fieldSold => 'Продано';

  @override
  String get fieldCurrentCount => 'Текущее количество';

  @override
  String get sectionFeed => 'Корма';

  @override
  String get sectionHealth => 'Здоровье';

  @override
  String get sectionProduction => 'Продукция';

  @override
  String get sectionMoney => 'Финансы';

  @override
  String get comingSoon => 'Скоро';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get languageSystem => 'Язык телефона';

  @override
  String get demoDataBanner => 'Демо-данные: пока ничего не сохраняется.';

  @override
  String daysValue(int days) {
    return '$days дн.';
  }

  @override
  String get welcomeSubtitle => 'Ваша ферма в кармане';

  @override
  String get chooseLanguage => 'Выберите язык';

  @override
  String get chooseGroup => 'Кого вы разводите?';

  @override
  String get groupBirds => 'Птицы';

  @override
  String get groupAnimals => 'Животные';

  @override
  String get groupBirdsHint => 'Перепела, куры';

  @override
  String get groupAnimalsHint => 'Кролики';

  @override
  String get chooseSpecies => 'Чем вы хотите управлять?';

  @override
  String get settingsStartPage => 'Стартовая страница';
}
