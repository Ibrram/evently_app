import 'package:evently_task_app/core/constants/app_assets.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController confirmPasswordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    AppProvider provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.register_account,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.primaryColor,
          ),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
        foregroundColor: theme.primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppAssets.logoV, height: 185),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    hintText: lang.name,
                    controller: nameText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return lang.name_empty_msg;
                      }
                      return null;
                    },
                    prefixWidget: const ImageIcon(
                      AssetImage(AppAssets.userIcon),
                      color: ColorPalette.textFormBorderColor,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: lang.email,
                    controller: emailText,
                    validator: (value) {
                      RegExp filter = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );
                      if (value == null || value.isEmpty) {
                        return lang.email_empty_msg;
                      }
                      if (!filter.hasMatch(value)) {
                        return lang.email_not_valid_msg;
                      }
                      return null;
                    },
                    prefixWidget: const ImageIcon(
                      AssetImage(AppAssets.emailIcon),
                      color: ColorPalette.textFormBorderColor,
                    ),
                  ),
                  CustomTextFormField(
                    isPassword: true,
                    hintText: lang.password,
                    validator: (value) {
                      RegExp filter = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*]).{8,}$',
                      );
                      if (value == null || value.isEmpty) {
                        return lang.password_empty_msg;
                      }
                      if (!filter.hasMatch(value)) {
                        return lang.password_not_valid_msg;
                      }

                      return null;
                    },
                    controller: passwordText,
                    prefixWidget: const ImageIcon(
                      AssetImage(AppAssets.passwordIcon),
                      color: ColorPalette.textFormBorderColor,
                    ),
                  ),
                  CustomTextFormField(
                    isPassword: true,
                    hintText: lang.re_password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return lang.password_confirmation_empty_msg;
                      }
                      if (value != passwordText.text) {
                        return lang.password_confirmation_not_match_msg;
                      }
                      return null;
                    },
                    controller: confirmPasswordText,
                    prefixWidget: const ImageIcon(
                      AssetImage(AppAssets.passwordIcon),
                      color: ColorPalette.textFormBorderColor,
                    ),
                  ),
                  CustomButton(
                    onPressed: () => createUser(lang),
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
                          color: provider.theme == ThemeMode.light
                              ? ColorPalette.blackTextColor
                              : ColorPalette.scaffoldBackground,
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
      ),
    );
  }

  void createUser(AppLocalizations lang) {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      FirebaseAuthUtil.createUserWithEmailAndPassword(
        nameText.text,
        emailText.text,
        passwordText.text,
      ).then((value) {
        EasyLoading.dismiss();
        if (!mounted) return;

        if (value == 'success') {
          Navigator.pop(context);
        }
        if (value == 'weak-password') {
          Toast.showWarningToast(title: lang.register_weak_password_msg);
        }
        if (value == 'email-already-in-use') {
          Toast.showWarningToast(title: lang.register_email_already_in_use_msg);
        }
      });
    }
  }
}
