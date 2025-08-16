import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  late final SharedPreferences prefs;
  Locale _locale = const Locale('en');
  ThemeMode _theme = ThemeMode.light;
  bool _onboardInitialized = false;
  Locale get locale => _locale;
  ThemeMode get theme => _theme;
  bool get onboardInitialized => _onboardInitialized;

  AppProvider(this.prefs) {
    String? lang = prefs.getString('lang');
    String? theme = prefs.getString('themeMode');
    if (lang != null) {
      _locale = Locale(lang);
    }
    if (theme != null) {
      _theme = theme == "dark" ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> setLocale(String val) async {
    _locale = Locale(val);
    await prefs.setString('lang', val);
    notifyListeners();
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    if (_theme == themeMode) return;
    _theme = themeMode;
    await prefs.setString(
      'themeMode',
      _theme == ThemeMode.dark ? 'dark' : 'light',
    );
    notifyListeners();
  }

  Future<void> setOnboardInitialized() async {
    await prefs.setBool('onboardInitialized', _onboardInitialized);
    _onboardInitialized = true;
    notifyListeners();
  }
}
