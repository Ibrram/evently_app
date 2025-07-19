import 'package:flutter/material.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
  );
  static ThemeData darkTheme = ThemeData();
}
