import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:flutter/material.dart';

class IndcatorWidget extends StatelessWidget {
  final int length;
  final int activeIndex;
  const IndcatorWidget({
    super.key,
    required this.length,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(length, (index) {
        return Container(
          width: activeIndex == index ? 21 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: activeIndex == index
                ? ColorPalette.primaryColor
                : ColorPalette.blackTextColor,
            borderRadius: BorderRadius.circular(36),
          ),
        );
      }),
    );
  }
}
