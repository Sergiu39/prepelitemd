import 'package:flutter/widgets.dart';

/// Holds the language chosen in Settings. `null` means "follow the phone".
class LocaleController extends ValueNotifier<Locale?> {
  LocaleController() : super(null);

  void setLocale(Locale? locale) => value = locale;
}
