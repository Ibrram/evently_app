import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.forget_password,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorPalette.blackTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.forgetPassImage),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  lang.reset_password,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
