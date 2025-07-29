import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/core/widgets/custom_text_form_field.dart';
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
    CategoryModel category = CategoryModel.categories[_currentCategoryIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
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
                CustomTextFormField(
                  hintText: 'Event Title',
                  controller: nameController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Event Title cannot be empty';
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
                  'Description',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: ColorPalette.blackTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: 'Event Description',
                  controller: descriptionController,
                  validator: (val) {
                    if (val == null || val.isEmpty || val.length < 20) {
                      return 'Event Description cannot be empty \nor less than 20 character';
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
                          'Event Date',
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
                        dateSelected ?? 'Choose Date',
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
                          'Event Time',
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
                        timeSelected ?? 'Choose Time',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.primaryColor,
                        ),
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
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;
                    if (dateSelected == null) {
                      return Toast.showWarningToast(
                        title: 'Date of Event cannot be empty',
                      );
                    }
                    if (timeSelected == null) {
                      return Toast.showWarningToast(
                        title: 'Time of Event cannot be empty',
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
                            '${nameController.text} Event Created Successfully',
                      );
                      Navigator.pop(context, true);
                    } else {
                      Toast.showErrorToast(
                        title: 'Cannot Create Events now try again Later!',
                      );
                    }
                    EasyLoading.dismiss();
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
