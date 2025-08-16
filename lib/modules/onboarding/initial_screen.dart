import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/routes/routes_name.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/l10n/app_localizations.dart';
import 'package:evently_task_app/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  String currentLangSelected = 'en';
  ThemeMode currentThemeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppProvider provider = Provider.of<AppProvider>(context);
    AppLocalizations lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              spacing: 28,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.logoH, height: 50),
                Image.asset(
                  AppAssets.initialOnboard,
                  fit: BoxFit.cover,
                  height: 361,
                ),
                Text(
                  lang.initial_on_board_head,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                Text(
                  lang.initial_on_board_sub,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: provider.theme == ThemeMode.light
                        ? ColorPalette.blackTextColor
                        : ColorPalette.scaffoldBackground,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lang.language_mode,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                    AnimatedToggleSwitch<String>.rolling(
                      current: currentLangSelected,
                      values: ['en', 'ar'],
                      onChanged: (i) {
                        setState(() {
                          currentLangSelected = i;
                          provider.setLocale(currentLangSelected);
                        });
                      },
                      iconList: [
                        Image.asset(AppAssets.enIcon, height: 31),
                        Image.asset(AppAssets.arIcon, height: 31),
                      ],
                      height: 35,
                      style: ToggleStyle(
                        backgroundColor: Colors.transparent,
                        borderColor: theme.primaryColor,
                        indicatorColor: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lang.theme_mode,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                    AnimatedToggleSwitch<ThemeMode>.rolling(
                      current: currentThemeMode,
                      values: [ThemeMode.light, ThemeMode.dark],
                      onChanged: (i) {
                        setState(() {
                          currentThemeMode = i;
                        });
                        provider.setTheme(currentThemeMode);
                      },
                      iconList: [
                        const Icon(Icons.sunny, color: Colors.white, size: 31),
                        Icon(
                          Icons.mode_night,
                          color: provider.theme == ThemeMode.light
                              ? theme.primaryColor
                              : Colors.white,
                          size: 31,
                        ),
                      ],
                      height: 35,
                      style: ToggleStyle(
                        backgroundColor: Colors.transparent,
                        borderColor: theme.primaryColor,
                        indicatorColor: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  backgroundColor: theme.primaryColor,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RoutesName.onBoard);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      lang.initial_on_board_button,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: ColorPalette.scaffoldBackground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
