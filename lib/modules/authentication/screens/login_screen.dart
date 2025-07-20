import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.logoV, height: 185),

            const SizedBox(height: 24),

            const CustomTextFormField(
              hintText: 'Email',
              prefixWidget: ImageIcon(
                AssetImage(AppAssets.emailIcon),
                color: ColorPalette.textFormBorderColor,
              ),
            ),

            const SizedBox(height: 16),

            const CustomTextFormField(
              hintText: 'Password',
              isPassword: true,
              prefixWidget: ImageIcon(
                AssetImage(AppAssets.passwordIcon),
                color: ColorPalette.textFormBorderColor,
              ),
            ),

            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: ColorPalette.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorPalette.primaryColor,
                    decorationThickness: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t Have Account?',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(4)),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(color: ColorPalette.primaryColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'OR',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: ColorPalette.primaryColor),
                  ),
                ],
              ),
            ),

            CustomButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Image.asset(AppAssets.googleIcon),
                    Text(
                      'Login with Google',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
