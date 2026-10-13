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

extension PurposeL10n on FlockPurpose {
  String label(AppLocalizations l10n) => switch (this) {
    FlockPurpose.eggs => l10n.purposeEggs,
    FlockPurpose.meat => l10n.purposeMeat,
    FlockPurpose.breeding => l10n.purposeBreeding,
  };
}

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
