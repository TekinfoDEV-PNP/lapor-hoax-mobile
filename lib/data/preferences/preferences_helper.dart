import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const DARK_THEME = 'DARK_THEME';
  static const LOGIN = 'LOGIN';
  static const SESSION = 'SESSION';

  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(DARK_THEME) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(DARK_THEME, value);
  }

  Future<String> get sessionData async {
    final prefs = await sharedPreferences;
    return prefs.getString(SESSION) ?? "";
  }

  void setSessionData(String value) async {
    final prefs = await sharedPreferences;
    prefs.setString(SESSION, value);
  }

  Future<bool> get isLogin async {
    final prefs = await sharedPreferences;
    return prefs.getBool(LOGIN) ?? false;
  }

  void setLogin(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(LOGIN, value);
  }
}