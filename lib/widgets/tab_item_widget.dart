import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/models/category_model.dart';
import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  const TabItemWidget({
    super.key,
    required this.category,
    required this.isActive,
    this.isEventPage = false,
  });
  final CategoryModel category;
  final bool isActive;
  final bool isEventPage;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isActive
            ? isEventPage
                  ? theme.primaryColor
                  : ColorPalette.scaffoldBackground
            : Colors.transparent,
        border: Border.all(
          color: isEventPage ? theme.primaryColor : Colors.white,
        ),
        borderRadius: BorderRadius.circular(46),
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(
            category.icon,
            size: 24,
            color: isActive
                ? isEventPage
                      ? ColorPalette.scaffoldBackground
                      : theme.primaryColor
                : isEventPage
                ? theme.primaryColor
                : ColorPalette.scaffoldBackground,
          ),
          Text(
            category.name,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isActive
                  ? isEventPage
                        ? ColorPalette.scaffoldBackground
                        : theme.primaryColor
                  : isEventPage
                  ? theme.primaryColor
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
