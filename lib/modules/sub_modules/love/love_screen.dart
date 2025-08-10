import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_task_app/l10n/app_localizations.dart';
import 'package:evently_task_app/models/category_model.dart';
import 'package:evently_task_app/models/event_model.dart';
import 'package:evently_task_app/modules/sub_modules/home/widgets/event_card_widget.dart';
import 'package:evently_task_app/utils/firebase_firestore_util.dart';
import 'package:flutter/material.dart';

class LoveScreen extends StatelessWidget {
  const LoveScreen({super.key});

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
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
            child: CustomTextFormField(
              hintText: lang.event_search_title,
              hintColor: theme.primaryColor,
              prefixWidget: Icon(
                Icons.search,
                size: 24,
                color: theme.primaryColor,
              ),
            ),
          ),

          Expanded(
            child: StreamBuilder<List<EventModel>>(
              stream: FirebaseFirestoreUtil.getFavEventsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // if (snapshot.hasError) {
                //   return ;
                // }

                List<EventModel> events = snapshot.data!;

                return ListView.builder(
                  itemCount: events.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  itemBuilder: (context, index) {
                    EventModel currentEvent = events[index];
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.241,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            categories[currentEvent.categoryId].backgroundImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: EventCardWidget(event: currentEvent),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
