import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/routes/routes_name.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_task_app/l10n/app_localizations.dart';
import 'package:evently_task_app/providers/app_provider.dart';
import 'package:evently_task_app/utils/firebase_auth_util.dart';
import 'package:evently_task_app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    AppProvider provider = Provider.of<AppProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(AppAssets.logoV, height: 185),

                    const SizedBox(height: 24),

                    CustomTextFormField(
                      hintText: lang.email,
                      controller: emailText,
                      validator: (value) {
                        RegExp filter = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        );
                        if (value == null || value.isEmpty) {
                          return lang.login_screen_email_empty_msg;
                        }
                        if (!filter.hasMatch(value)) {
                          return lang.login_screen_email_not_vaild_email_msg;
                        }
                        return null;
                      },
                      prefixWidget: const ImageIcon(
                        AssetImage(AppAssets.emailIcon),
                        color: ColorPalette.textFormBorderColor,
                      ),
                    ),

                    const SizedBox(height: 16),

                    CustomTextFormField(
                      hintText: lang.password,
                      controller: passwordText,
                      validator: (value) {
                        RegExp filter = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*]).{8,}$',
                        );
                        if (value == null || value.isEmpty) {
                          return lang.login_screen_password_empty_msg;
                        }
                        if (!filter.hasMatch(value)) {
                          return lang.login_screen_password_not_valid_msg;
                        }

                        return null;
                      },
                      isPassword: true,
                      prefixWidget: const ImageIcon(
                        AssetImage(AppAssets.passwordIcon),
                        color: ColorPalette.textFormBorderColor,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.forgetPassword,
                          );
                        },
                        child: Text(
                          lang.forget_password,
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
                      onPressed: () => loginEvent(lang),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          lang.login,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Text(
                          lang.dont_have_account,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: provider.theme == ThemeMode.light
                                ? ColorPalette.blackTextColor
                                : ColorPalette.scaffoldBackground,
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
                            lang.create_account,
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              lang.or,
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
                      backgroundColor: Colors.transparent,
                      onPressed: () => FirebaseAuthUtil.signInWithGoogle(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Image.asset(AppAssets.googleIcon),
                            Text(
                              lang.login_with_google,
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
      ),
    );
  }

  void loginEvent(AppLocalizations lang) {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      FirebaseAuthUtil.signInUserWithEmailAndPassword(
        emailText.text,
        passwordText.text,
      ).then((value) {
        EasyLoading.dismiss();
        if (!mounted) return;
        if (value == 'success') {
          Toast.showSuccessToast(title: lang.login_successfully_msg);
          Navigator.pushReplacementNamed(context, RoutesName.layoutController);
        }
        if (value == 'invalid-credential') {
          Toast.showWarningToast(title: lang.login_invalid_credential_msg);
        }
        if (value == 'unexpected') {
          Toast.showWarningToast(title: lang.login_unexpected_msg);
        }
      });
    }
  }
}
