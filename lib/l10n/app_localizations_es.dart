// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'prepeliteMD';

  @override
  String get navDashboard => 'Inicio';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get speciesQuail => 'Codornices';

  @override
  String get speciesChicken => 'Gallinas';

  @override
  String get speciesRabbit => 'Conejos';

  @override
  String get purposeEggs => 'Huevos';

  @override
  String get purposeMeat => 'Carne';

  @override
  String get purposeBreeding => 'Cría';

  @override
  String get dashboardEggsToday => 'Huevos hoy';

  @override
  String get dashboardEggsWeek => 'Huevos, últimos 7 días';

  @override
  String get dashboardAliveAnimals => 'Animales vivos';

  @override
  String activeFlocks(int count) {
    return 'Lotes activos: $count';
  }

  @override
  String get flocksEmpty => 'Aún no hay lotes';

  @override
  String get addFlock => 'Añadir lote';

  @override
  String ageDays(int days) {
    return 'Edad: $days d';
  }

  @override
  String eggsTodayCount(int count) {
    return 'Huevos hoy: $count';
  }

  @override
  String get flockNotFound => 'Lote no encontrado';

  @override
  String get fieldSpecies => 'Especie';

  @override
  String get fieldPurpose => 'Finalidad';

  @override
  String get fieldStartDate => 'Fecha de entrada';

  @override
  String get fieldAge => 'Edad';

  @override
  String get fieldInitialCount => 'Cantidad inicial';

  @override
  String get fieldDeaths => 'Bajas';

  @override
  String get fieldSold => 'Vendidos';

  @override
  String get fieldCurrentCount => 'Cantidad actual';

  @override
  String get sectionFeed => 'Alimento';

  @override
  String get sectionHealth => 'Salud';

  @override
  String get sectionProduction => 'Producción';

  @override
  String get sectionMoney => 'Dinero';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get languageSystem => 'Idioma del teléfono';

  @override
  String get demoDataBanner => 'Datos de ejemplo: aún no se guarda nada.';

  @override
  String daysValue(int days) {
    return '$days días';
  }

  @override
  String get welcomeSubtitle => 'Tu granja, en tu bolsillo';

  @override
  String get chooseLanguage => 'Elige tu idioma';

  @override
  String get chooseGroup => '¿Qué crías?';

  @override
  String get groupBirds => 'Aves';

  @override
  String get groupAnimals => 'Animales';

  @override
  String get groupBirdsHint => 'Codornices, gallinas';

  @override
  String get groupAnimalsHint => 'Conejos';

  @override
  String get chooseSpecies => '¿Qué quieres gestionar?';

  @override
  String get settingsStartPage => 'Página de inicio';
}
