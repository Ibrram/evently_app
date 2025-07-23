import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/modules/sub_modules/home/models/category_model.dart';
import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  const TabItemWidget({
    super.key,
    required this.category,
    required this.isActive,
  });
  final CategoryModel category;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isActive ? ColorPalette.scaffoldBackground : Colors.transparent,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(46),
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(
            category.icon,
            size: 24,
            color: isActive
                ? theme.primaryColor
                : ColorPalette.scaffoldBackground,
          ),
          Text(
            category.name,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isActive ? theme.primaryColor : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
