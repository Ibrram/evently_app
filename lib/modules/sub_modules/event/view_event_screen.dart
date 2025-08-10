import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/l10n/app_localizations.dart';
import 'package:evently_task_app/models/category_model.dart';
import 'package:evently_task_app/models/event_model.dart';
import 'package:flutter/material.dart';

class ViewEventScreen extends StatelessWidget {
  const ViewEventScreen({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    AppLocalizations lang = AppLocalizations.of(context)!;
    final List<CategoryModel> categories = [
      CategoryModel(
        icon: Icons.pedal_bike_outlined,
        backgroundImage: AppAssets.sportEventBackground,
        name: lang.sport,
      ),
      CategoryModel(
        icon: Icons.cake_outlined,
        backgroundImage: AppAssets.birthDayEventBackground,
        name: lang.birth_day,
      ),
      CategoryModel(
        icon: Icons.menu_book_rounded,
        backgroundImage: AppAssets.bookClubEventBackground,
        name: lang.book_club,
      ),
      CategoryModel(
        icon: Icons.video_chat_outlined,
        backgroundImage: AppAssets.meetingEventBackground,
        name: lang.meeting,
      ),
      CategoryModel(
        icon: Icons.gamepad_outlined,
        backgroundImage: AppAssets.gamingEventBackground,
        name: lang.gaming,
      ),
      CategoryModel(
        icon: Icons.free_cancellation_outlined,
        backgroundImage: AppAssets.holidayEventBackground,
        name: lang.holiday,
      ),
      CategoryModel(
        icon: Icons.fastfood_outlined,
        backgroundImage: AppAssets.eatingEventBackground,
        name: lang.eating,
      ),
      CategoryModel(
        icon: Icons.workspace_premium_outlined,
        backgroundImage: AppAssets.workShopEventBackground,
        name: lang.work_shop,
      ),
      CategoryModel(
        icon: Icons.museum_outlined,
        backgroundImage: AppAssets.exhibitionEventBackground,
        name: lang.exhibition,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.event_details_screen_appbar_title),
        actions: [
          Icon(Icons.mode_edit_outlined, size: 24, color: theme.primaryColor),
          const SizedBox(width: 10),
          const Icon(
            Icons.delete_outline,
            size: 24,
            color: ColorPalette.textFormBorderErrorColor,
          ),
        ],
        forceMaterialTransparency: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  categories[event.categoryId].backgroundImage,
                ),
              ),
              Text(
                event.name,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              CustomButton(
                backgroundColor: Colors.transparent,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.calendar_month_outlined,
                              size: 24,
                              color: ColorPalette.scaffoldBackground,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Text(
                                event.date,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.primaryColor,
                                ),
                              ),
                              Text(
                                event.time,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: ColorPalette.blackTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                backgroundColor: Colors.transparent,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.my_location_sharp,
                              size: 24,
                              color: ColorPalette.scaffoldBackground,
                            ),
                          ),
                          Text(
                            'Cairo , Egypt',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 24,
                        color: theme.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                lang.event_description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: ColorPalette.blackTextColor,
                ),
              ),
              Text(
                event.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: ColorPalette.blackTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
