import 'package:evently_task_app/core/routes/routes_name.dart';
import 'package:evently_task_app/models/event_model.dart';
import 'package:evently_task_app/modules/authentication/screens/forget_password_screen.dart';
import 'package:evently_task_app/modules/authentication/screens/login_screen.dart';
import 'package:evently_task_app/modules/authentication/screens/register_screen.dart';
import 'package:evently_task_app/modules/splash/splash_screen.dart';
import 'package:evently_task_app/modules/sub_modules/event/create_event_screen.dart';
import 'package:evently_task_app/modules/sub_modules/event/edit_event_screen.dart';
import 'package:evently_task_app/modules/sub_modules/event/view_event_screen.dart';
import 'package:evently_task_app/modules/sub_modules/layout_controller.dart';
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
      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
          settings: settings,
        );
      //
      case RoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
          settings: settings,
        );
      //
      case RoutesName.layoutController:
        return MaterialPageRoute(
          builder: (context) => const LayoutController(),
          settings: settings,
        );
      //
      case RoutesName.createEvent:
        return MaterialPageRoute(
          builder: (context) => const CreateEventScreen(),
          settings: settings,
        );
      case RoutesName.viewEvent:
        final event = settings.arguments as EventModel;
        return MaterialPageRoute(
          builder: (context) => ViewEventScreen(event: event),
          settings: settings,
        );
      case RoutesName.editEvent:
        final event = settings.arguments as EventModel;
        return MaterialPageRoute(
          builder: (context) => EditEventScreen(event: event),
          settings: settings,
        );
      //
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
