import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardCardView extends StatelessWidget {
  const OnboardCardView({super.key, required this.content});
  final Map<String, dynamic> content;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppProvider provider = Provider.of<AppProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 39,
        children: [
          Image.asset(content['img'], fit: BoxFit.cover),
          Text(
            content['title'],
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            content['desc'],
            style: theme.textTheme.bodyMedium?.copyWith(
              color: provider.theme == ThemeMode.light
                  ? ColorPalette.blackTextColor
                  : ColorPalette.scaffoldBackground,
            ),
          ),
        ],
      ),
    );
  }
}
