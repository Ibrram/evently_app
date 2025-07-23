import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/routes/routes_name.dart';
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
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
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.forgetPassword);
                      },
                      child: Text(
                        'Forget Password?',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: ColorPalette.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPalette.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.layoutController,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Login', style: theme.textTheme.bodyLarge),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t Have Account?',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: ColorPalette.blackTextColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.register);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(4),
                        ),
                        child: Text(
                          'Create Account',
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

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 24,
                    ),
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
          ),
        ),
      ),
    );
  }
}
