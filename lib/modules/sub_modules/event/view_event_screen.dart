import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/core/widgets/custom_button.dart';
import 'package:evently_task_app/models/category_model.dart';
import 'package:evently_task_app/models/event_model.dart';
import 'package:flutter/material.dart';

class ViewEventScreen extends StatelessWidget {
  const ViewEventScreen({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
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
                  CategoryModel.categories[event.categoryId].backgroundImage,
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
                'Description',
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
