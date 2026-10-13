import 'package:flutter/widgets.dart';

import 'app_prefs.dart';

/// Holds the chosen language. `null` means "follow the phone".
class LocaleController extends ValueNotifier<Locale?> {
  LocaleController({this.prefs})
    : super(prefs?.languageCode == null ? null : Locale(prefs!.languageCode!));

  final AppPrefs? prefs;

  void setLocale(Locale? locale) {
    value = locale;
    prefs?.setLanguageCode(locale?.languageCode);
  }
}
