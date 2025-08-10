import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme(String locale) {
    return ThemeData(
      scaffoldBackgroundColor: ColorPalette.scaffoldBackground,
      appBarTheme: AppBarTheme(
        // scrolledUnderElevation: 0.0,
        // elevation: 0.0,
        foregroundColor: ColorPalette.primaryColor,
        centerTitle: true,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
        titleTextStyle: TextStyle(
          fontFamily: locale == 'en' ? 'Inter' : 'Cairo',
          fontSize: 22,
          color: ColorPalette.primaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      primaryColor: ColorPalette.primaryColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorPalette.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontFamily: locale == 'en' ? 'Inter' : 'Cairo',
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: locale == 'en' ? 'Inter' : 'Cairo',
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: locale == 'en' ? 'Inter' : 'Cairo',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontFamily: locale == 'en' ? 'Inter' : 'Cairo',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }

  static ThemeData darkTheme = ThemeData();
}
