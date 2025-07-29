import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_task_app/models/category_model.dart';
import 'package:evently_task_app/widgets/tab_item_widget.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int _currentCategoryIndex = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   _currentEventBackground = getImagePathByCategoryName(
  //     CategoriesConstant.categories[0].name,
  //   );
  //   category = CategoriesConstant.categories[_currentCategoryIndex].name;
  // }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    CategoryModel category = CategoryModel.categories[_currentCategoryIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(category.backgroundImage),
              ),

              const SizedBox(height: 16),

              DefaultTabController(
                length: CategoryModel.categories.length,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  labelPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  onTap: (value) {
                    setState(() {
                      _currentCategoryIndex = value;
                    });
                  },
                  tabs: CategoryModel.categories.map((data) {
                    return TabItemWidget(
                      category: data,
                      isActive:
                          CategoryModel.categories.indexOf(data) ==
                          _currentCategoryIndex,
                      isEventPage: true,
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 16),
              Text(
                'Title',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: ColorPalette.blackTextColor,
                ),
              ),
              const SizedBox(height: 8),
              const CustomTextFormField(
                hintText: 'Event Title',
                prefixWidget: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: ImageIcon(
                    AssetImage(AppAssets.noteEdit),
                    color: ColorPalette.textFormHintTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Description',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: ColorPalette.blackTextColor,
                ),
              ),
              const SizedBox(height: 8),
              const CustomTextFormField(
                hintText: 'Event Description',
                maxLine: 10,
                textInputType: TextInputType.multiline,
                minLine: 6,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        size: 24,
                        color: ColorPalette.blackTextColor,
                      ),
                      Text(
                        'Event Date',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: ColorPalette.blackTextColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Choose Date',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        size: 24,
                        color: ColorPalette.blackTextColor,
                      ),
                      Text(
                        'Event Time',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: ColorPalette.blackTextColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Choose Time',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Text(
                'Location',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: ColorPalette.blackTextColor,
                ),
              ),

              const SizedBox(height: 8),

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
                            'Choose Event Location',
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

              const SizedBox(height: 16),

              CustomButton(
                onPressed: () {
                  // EasyLoading.show(
                  //   maskType: EasyLoadingMaskType.black,
                  //   status: 'Success',
                  // );
                  // FirebaseFirestoreUtil.createEvent(
                  //   EventModel(
                  //     id: '0',
                  //     name: name,
                  //     category: category,
                  //     description: description,
                  //     isFavourite: false,
                  //   ),
                  //   context,
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Add Event', style: theme.textTheme.bodyLarge),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
