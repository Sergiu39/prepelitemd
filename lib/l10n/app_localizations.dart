import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ro'),
    Locale('ru'),
    Locale('tr'),
    Locale('uk'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'prepeliteMD'**
  String get appTitle;

  /// No description provided for @navDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get navDashboard;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @speciesQuail.
  ///
  /// In en, this message translates to:
  /// **'Quail'**
  String get speciesQuail;

  /// No description provided for @speciesChicken.
  ///
  /// In en, this message translates to:
  /// **'Chickens'**
  String get speciesChicken;

  /// No description provided for @speciesRabbit.
  ///
  /// In en, this message translates to:
  /// **'Rabbits'**
  String get speciesRabbit;

  /// No description provided for @purposeEggs.
  ///
  /// In en, this message translates to:
  /// **'Eggs'**
  String get purposeEggs;

  /// No description provided for @purposeMeat.
  ///
  /// In en, this message translates to:
  /// **'Meat'**
  String get purposeMeat;

  /// No description provided for @purposeBreeding.
  ///
  /// In en, this message translates to:
  /// **'Breeding'**
  String get purposeBreeding;

  /// No description provided for @dashboardEggsToday.
  ///
  /// In en, this message translates to:
  /// **'Eggs today'**
  String get dashboardEggsToday;

  /// No description provided for @dashboardEggsWeek.
  ///
  /// In en, this message translates to:
  /// **'Eggs, last 7 days'**
  String get dashboardEggsWeek;

  /// No description provided for @dashboardAliveAnimals.
  ///
  /// In en, this message translates to:
  /// **'Live animals'**
  String get dashboardAliveAnimals;

  /// No description provided for @activeFlocks.
  ///
  /// In en, this message translates to:
  /// **'Active flocks: {count}'**
  String activeFlocks(int count);

  /// No description provided for @flocksEmpty.
  ///
  /// In en, this message translates to:
  /// **'No flocks yet'**
  String get flocksEmpty;

  /// No description provided for @addFlock.
  ///
  /// In en, this message translates to:
  /// **'Add flock'**
  String get addFlock;

  /// No description provided for @ageDays.
  ///
  /// In en, this message translates to:
  /// **'Age: {days} d'**
  String ageDays(int days);

  /// No description provided for @eggsTodayCount.
  ///
  /// In en, this message translates to:
  /// **'Eggs today: {count}'**
  String eggsTodayCount(int count);

  /// No description provided for @flockNotFound.
  ///
  /// In en, this message translates to:
  /// **'Flock not found'**
  String get flockNotFound;

  /// No description provided for @fieldSpecies.
  ///
  /// In en, this message translates to:
  /// **'Species'**
  String get fieldSpecies;

  /// No description provided for @fieldPurpose.
  ///
  /// In en, this message translates to:
  /// **'Purpose'**
  String get fieldPurpose;

  /// No description provided for @fieldStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get fieldStartDate;

  /// No description provided for @fieldAge.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get fieldAge;

  /// No description provided for @fieldInitialCount.
  ///
  /// In en, this message translates to:
  /// **'Initial count'**
  String get fieldInitialCount;

  /// No description provided for @fieldDeaths.
  ///
  /// In en, this message translates to:
  /// **'Deaths'**
  String get fieldDeaths;

  /// No description provided for @fieldSold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get fieldSold;

  /// No description provided for @fieldCurrentCount.
  ///
  /// In en, this message translates to:
  /// **'Current count'**
  String get fieldCurrentCount;

  /// No description provided for @sectionFeed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get sectionFeed;

  /// No description provided for @sectionHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get sectionHealth;

  /// No description provided for @sectionProduction.
  ///
  /// In en, this message translates to:
  /// **'Production'**
  String get sectionProduction;

  /// No description provided for @sectionMoney.
  ///
  /// In en, this message translates to:
  /// **'Money'**
  String get sectionMoney;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'Phone language'**
  String get languageSystem;

  /// No description provided for @demoDataBanner.
  ///
  /// In en, this message translates to:
  /// **'Sample data: nothing is saved yet.'**
  String get demoDataBanner;

  /// No description provided for @daysValue.
  ///
  /// In en, this message translates to:
  /// **'{days} days'**
  String daysValue(int days);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'en',
    'es',
    'fr',
    'ro',
    'ru',
    'tr',
    'uk',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
