import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  late final SharedPreferences prefs;
  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  AppProvider(this.prefs) {
    String? lang = prefs.getString('lang');
    if (lang != null) {
      _locale = Locale(lang);
    }
  }

  Future<void> setLocale(String val) async {
    _locale = Locale(val);
    await prefs.setString('lang', val);
    notifyListeners();
  }
}
