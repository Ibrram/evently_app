import 'package:evently_task_app/core/routes/app_routes.dart';
import 'package:evently_task_app/core/routes/routes_name.dart';
import 'package:evently_task_app/core/theme_manager/app_theme_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      initialRoute: RoutesName.initial,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
