import 'package:flutter/widgets.dart';

import '../l10n/app_localizations.dart';
import '../models/species.dart';

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension SpeciesL10n on Species {
  String label(AppLocalizations l10n) => switch (this) {
    Species.quail => l10n.speciesQuail,
    Species.chicken => l10n.speciesChicken,
    Species.rabbit => l10n.speciesRabbit,
  };
}

extension SpeciesGroupL10n on SpeciesGroup {
  String label(AppLocalizations l10n) => switch (this) {
    SpeciesGroup.birds => l10n.groupBirds,
    SpeciesGroup.animals => l10n.groupAnimals,
  };

  String hint(AppLocalizations l10n) => switch (this) {
    SpeciesGroup.birds => l10n.groupBirdsHint,
    SpeciesGroup.animals => l10n.groupAnimalsHint,
  };
}

extension PurposeL10n on FlockPurpose {
  String label(AppLocalizations l10n) => switch (this) {
    FlockPurpose.eggs => l10n.purposeEggs,
    FlockPurpose.meat => l10n.purposeMeat,
    FlockPurpose.breeding => l10n.purposeBreeding,
  };
}

/// Flag shown next to each language on the start page. Romanian uses the
/// Moldovan flag (the app's home market); English uses the UK flag.
const languageFlags = {
  'ro': 'MD',
  'ru': 'RU',
  'uk': 'UA',
  'en': 'GB',
  'es': 'ES',
  'fr': 'FR',
  'tr': 'TR',
};

/// Native names, shown the same in every language so people can find theirs.
const languageNames = {
  'ro': 'Română',
  'ru': 'Русский',
  'uk': 'Українська',
  'en': 'English',
  'es': 'Español',
  'fr': 'Français',
  'tr': 'Türkçe',
};
