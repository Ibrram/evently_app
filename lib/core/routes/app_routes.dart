import 'package:evently_task_app/core/routes/routes_name.dart';
import 'package:evently_task_app/modules/authentication/screens/login_screen.dart';
import 'package:evently_task_app/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      //
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
      //
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
