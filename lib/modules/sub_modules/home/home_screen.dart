import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/models/category_model.dart';
import 'package:evently_task_app/models/event_model.dart';
import 'package:evently_task_app/modules/sub_modules/home/widgets/event_card_widget.dart';
import 'package:evently_task_app/utils/firebase_firestore_util.dart';
import 'package:evently_task_app/widgets/tab_item_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentCategoryIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: SafeArea(
            child: Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back ✨',
                          style: theme.textTheme.bodySmall,
                        ),
                        Text(
                          'John Safwat',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 11.5),
                        Row(
                          children: [
                            const ImageIcon(
                              AssetImage(AppAssets.mapIcon),
                              color: ColorPalette.scaffoldBackground,
                            ),
                            Text(
                              'Cairo , Egypt',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        const Icon(
                          Icons.wb_sunny_outlined,
                          color: ColorPalette.scaffoldBackground,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: ColorPalette.scaffoldBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'EN',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                DefaultTabController(
                  length: CategoryModel.categories.length,
                  child: TabBar(
                    onTap: (value) {
                      setState(() {
                        currentCategoryIndex = value;
                      });
                    },
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.transparent,
                    labelPadding: EdgeInsets.zero,
                    tabs: CategoryModel.categories.map((data) {
                      return TabItemWidget(
                        category: data,
                        isActive:
                            CategoryModel.categories.indexOf(data) ==
                            currentCategoryIndex,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<List<EventModel>>(
            stream: FirebaseFirestoreUtil.getEventsStream(
              catId: currentCategoryIndex,
            ),
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
                      border: Border.all(color: Theme.of(context).primaryColor),
                      image: DecorationImage(
                        image: AssetImage(
                          CategoryModel
                              .categories[currentEvent.categoryId]
                              .backgroundImage,
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
    );
  }
}
