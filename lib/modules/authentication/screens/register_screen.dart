import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorPalette.blackTextColor,
          ),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logoV, height: 185),
              const SizedBox(height: 8),
              const CustomTextFormField(
                hintText: 'Name',
                prefixWidget: ImageIcon(
                  AssetImage(AppAssets.userIcon),
                  color: ColorPalette.textFormBorderColor,
                ),
              ),
              const CustomTextFormField(
                hintText: 'Email',
                prefixWidget: ImageIcon(
                  AssetImage(AppAssets.emailIcon),
                  color: ColorPalette.textFormBorderColor,
                ),
              ),
              const CustomTextFormField(
                isPassword: true,
                hintText: 'Password',
                prefixWidget: ImageIcon(
                  AssetImage(AppAssets.passwordIcon),
                  color: ColorPalette.textFormBorderColor,
                ),
              ),
              const CustomTextFormField(
                isPassword: true,
                hintText: 'Re Password',
                prefixWidget: ImageIcon(
                  AssetImage(AppAssets.passwordIcon),
                  color: ColorPalette.textFormBorderColor,
                ),
              ),
              CustomButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Register', style: theme.textTheme.bodyLarge),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Account?',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: ColorPalette.blackTextColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(4),
                      minimumSize: Size.zero,
                    ),
                    child: Text(
                      'Login',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: ColorPalette.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorPalette.primaryColor,
                        decorationThickness: 2,
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
    );
  }
}
