// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'prepeliteMD';

  @override
  String get navDashboard => 'Ana sayfa';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get speciesQuail => 'Bıldırcınlar';

  @override
  String get speciesChicken => 'Tavuklar';

  @override
  String get speciesRabbit => 'Tavşanlar';

  @override
  String get purposeEggs => 'Yumurta';

  @override
  String get purposeMeat => 'Et';

  @override
  String get purposeBreeding => 'Damızlık';

  @override
  String get dashboardEggsToday => 'Bugünkü yumurta';

  @override
  String get dashboardEggsWeek => 'Yumurta, son 7 gün';

  @override
  String get dashboardAliveAnimals => 'Canlı hayvanlar';

  @override
  String activeFlocks(int count) {
    return 'Aktif gruplar: $count';
  }

  @override
  String get flocksEmpty => 'Henüz grup yok';

  @override
  String get addFlock => 'Grup ekle';

  @override
  String ageDays(int days) {
    return 'Yaş: $days gün';
  }

  @override
  String eggsTodayCount(int count) {
    return 'Bugünkü yumurta: $count';
  }

  @override
  String get flockNotFound => 'Grup bulunamadı';

  @override
  String get fieldSpecies => 'Tür';

  @override
  String get fieldPurpose => 'Amaç';

  @override
  String get fieldStartDate => 'Giriş tarihi';

  @override
  String get fieldAge => 'Yaş';

  @override
  String get fieldInitialCount => 'Başlangıç sayısı';

  @override
  String get fieldDeaths => 'Ölüm';

  @override
  String get fieldSold => 'Satılan';

  @override
  String get fieldCurrentCount => 'Mevcut sayı';

  @override
  String get sectionFeed => 'Yem';

  @override
  String get sectionHealth => 'Sağlık';

  @override
  String get sectionProduction => 'Üretim';

  @override
  String get sectionMoney => 'Para';

  @override
  String get comingSoon => 'Yakında';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get languageSystem => 'Telefon dili';

  @override
  String get demoDataBanner => 'Örnek veriler: henüz hiçbir şey kaydedilmiyor.';

  @override
  String daysValue(int days) {
    return '$days gün';
  }
}
