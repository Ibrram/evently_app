import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_task_app/l10n/app_localizations.dart';
import 'package:evently_task_app/models/category_model.dart';
import 'package:evently_task_app/models/event_model.dart';
import 'package:evently_task_app/utils/firebase_firestore_util.dart';
import 'package:evently_task_app/utils/toast.dart';
import 'package:evently_task_app/widgets/tab_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int _currentCategoryIndex = 0;
  String? dateSelected;
  String? timeSelected;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
    CategoryModel category = categories[_currentCategoryIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.event_screen_appbar_title),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(category.backgroundImage),
                ),

                const SizedBox(height: 16),

                DefaultTabController(
                  length: categories.length,
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
                    tabs: categories.map((data) {
                      return TabItemWidget(
                        category: data,
                        isActive:
                            categories.indexOf(data) == _currentCategoryIndex,
                        isEventPage: true,
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 16),
                Text(
                  lang.event_title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: ColorPalette.blackTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: lang.event_title_hint,
                  controller: nameController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return lang.event_name_empty_error;
                    }
                    return null;
                  },
                  prefixWidget: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: ImageIcon(
                      AssetImage(AppAssets.noteEdit),
                      color: ColorPalette.textFormHintTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  lang.event_description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: ColorPalette.blackTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: lang.event_description_hint,
                  controller: descriptionController,
                  validator: (val) {
                    if (val == null || val.isEmpty || val.length < 20) {
                      return lang.event_description_empty_error;
                    }
                    return null;
                  },
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
                          lang.event_date,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: ColorPalette.blackTextColor,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => _showDatePicker(),
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text(
                        dateSelected ?? lang.event_choose_date,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.primaryColor,
                        ),
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
                          lang.event_time,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: ColorPalette.blackTextColor,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => _showTimePicker(),
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text(
                        timeSelected ?? lang.event_choose_time,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Text(
                  lang.event_location,
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
                              lang.event_location_text,
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
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;
                    if (dateSelected == null) {
                      return Toast.showWarningToast(
                        title: lang.event_toast_date_empty,
                      );
                    }
                    if (timeSelected == null) {
                      return Toast.showWarningToast(
                        title: lang.event_toast_time_empty,
                      );
                    }
                    EasyLoading.show(maskType: EasyLoadingMaskType.black);
                    final isCreated = await FirebaseFirestoreUtil.createEvent(
                      EventModel(
                        name: nameController.text,
                        categoryId: _currentCategoryIndex,
                        description: descriptionController.text,
                        date: dateSelected!,
                        time: timeSelected!,
                      ),
                    );

                    if (!context.mounted) return;

                    if (isCreated) {
                      Toast.showSuccessToast(
                        title:
                            '${nameController.text} ${lang.event_toast_create_success}',
                      );
                      Navigator.pop(context, true);
                    } else {
                      Toast.showErrorToast(
                        title: lang.event_toast_create_error,
                      );
                    }
                    EasyLoading.dismiss();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      lang.event_add_button_text,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker() async {
    await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      currentDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          dateSelected = DateFormat('yyyy-MM-dd').format(value);
        });
      }
    });
  }

  Future<void> _showTimePicker() async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now()).then((
      value,
    ) {
      if (value != null) {
        setState(() {
          final now = DateTime.now();
          final formatDate = DateTime(
            now.year,
            now.month,
            now.day,
            value.hour,
            value.minute,
          );
          timeSelected = DateFormat('hh:mma').format(formatDate);
        });
      }
    });
  }
}
