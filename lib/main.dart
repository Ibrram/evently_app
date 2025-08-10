import 'package:bot_toast/bot_toast.dart';
import 'package:evently_task_app/core/routes/app_routes.dart';
import 'package:evently_task_app/core/routes/routes_name.dart';
import 'package:evently_task_app/core/theme_manager/app_theme_manager.dart';
import 'package:evently_task_app/providers/app_provider.dart';
//firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
//
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(prefs),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Locale locale = Provider.of<AppProvider>(context).locale;

    return MaterialApp(
      theme: AppThemeManager.lightTheme(locale.toString()),
      darkTheme: AppThemeManager.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: RoutesName.initial,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}
