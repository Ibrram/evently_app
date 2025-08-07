import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/modules/sub_modules/profile/widgets/drop_down_menu_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          height: 256,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(64),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 16,
                children: [
                  Image.asset(AppAssets.routeWhiteLogo, width: 124),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ibram Nagy', style: theme.textTheme.titleLarge),
                      Text('me@ibram.dev', style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Language',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.blackTextColor,
                  ),
                ),
                const DropDownMenuWidget(
                  items: [
                    DropdownMenuItem(value: 'ar', child: Text('Arabic')),
                    DropdownMenuItem(value: 'en', child: Text('English')),
                  ],
                ),
                Text(
                  'Theme',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.blackTextColor,
                  ),
                ),
                const DropDownMenuWidget(
                  items: [
                    DropdownMenuItem(value: 'light', child: Text('Light')),
                    DropdownMenuItem(value: 'dark', child: Text('Dark')),
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: CustomButton(
                    onPressed: () {},
                    backgroundColor: ColorPalette.textFormBorderErrorColor,
                    borderColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        spacing: 8,
                        children: [
                          const Icon(
                            Icons.exit_to_app_rounded,
                            size: 24,
                            color: Colors.white,
                          ),
                          Text(
                            'Logout',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
