import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_task_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.register_account,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorPalette.blackTextColor,
          ),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.logoV, height: 185),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: lang.name,
                  prefixWidget: const ImageIcon(
                    AssetImage(AppAssets.userIcon),
                    color: ColorPalette.textFormBorderColor,
                  ),
                ),
                CustomTextFormField(
                  hintText: lang.email,
                  prefixWidget: const ImageIcon(
                    AssetImage(AppAssets.emailIcon),
                    color: ColorPalette.textFormBorderColor,
                  ),
                ),
                CustomTextFormField(
                  isPassword: true,
                  hintText: lang.password,
                  prefixWidget: const ImageIcon(
                    AssetImage(AppAssets.passwordIcon),
                    color: ColorPalette.textFormBorderColor,
                  ),
                ),
                CustomTextFormField(
                  isPassword: true,
                  hintText: lang.re_password,
                  prefixWidget: const ImageIcon(
                    AssetImage(AppAssets.passwordIcon),
                    color: ColorPalette.textFormBorderColor,
                  ),
                ),
                CustomButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      lang.register,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      lang.already_have_account,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: ColorPalette.blackTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        minimumSize: Size.zero,
                      ),
                      child: Text(
                        lang.login,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: ColorPalette.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPalette.primaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
