import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/models/event_model.dart';
import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: ColorPalette.scaffoldBackground.withAlpha(204),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            event.date,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: ColorPalette.scaffoldBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  event.name,
                  textAlign: TextAlign.start,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: ColorPalette.blackTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Icon(Icons.favorite_border, color: theme.primaryColor, size: 24),
            ],
          ),
        ),
      ],
    );
  }
}
