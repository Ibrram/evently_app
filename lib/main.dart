import 'package:evently_task_app/core/routes/app_routes.dart';
import 'package:evently_task_app/core/routes/routes_name.dart';
import 'package:evently_task_app/core/theme_manager/app_theme_manager.dart';
//firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'firebase_options.dart';
//
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: RoutesName.initial,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}
