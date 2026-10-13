import 'package:shared_preferences/shared_preferences.dart';

/// Small choices remembered on the device so returning users skip the start
/// page: the language and the last section they used.
class AppPrefs {
  AppPrefs(this._prefs);

  static Future<AppPrefs> load() async =>
      AppPrefs(await SharedPreferences.getInstance());

  final SharedPreferences _prefs;

  static const _languageKey = 'language';
  static const _lastSectionKey = 'lastSection';

  String? get languageCode => _prefs.getString(_languageKey);

  Future<void> setLanguageCode(String? code) => code == null
      ? _prefs.remove(_languageKey)
      : _prefs.setString(_languageKey, code);

  /// Route path of the last section opened, e.g. `/quail`. `null` on first run.
  String? get lastSection => _prefs.getString(_lastSectionKey);

  Future<void> setLastSection(String path) =>
      _prefs.setString(_lastSectionKey, path);
}
