import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.scaffoldBackground,
    primaryColor: ColorPalette.primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Colors.white),
      selectedItemColor: Colors.white,
      unselectedIconTheme: IconThemeData(color: Colors.white),
      unselectedItemColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
