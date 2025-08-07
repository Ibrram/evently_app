import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.child,
    this.backgroundColor,
    this.onPressed,
    this.borderColor = ColorPalette.primaryColor,
  });

  final Widget? child;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorPalette.primaryColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: child,
    );
  }
}
