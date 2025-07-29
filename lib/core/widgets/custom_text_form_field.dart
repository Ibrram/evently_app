import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.prefixWidget,
    this.prefixColor,
    this.hintText,
    this.controller,
    this.isPassword = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLine,
    this.minLine,
    this.textInputType,
    this.validator,
  });

  final Widget? prefixWidget;
  final Color? prefixColor;
  final String? hintText;
  final bool isPassword;
  final int? maxLine;
  final int? minLine;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obScureStatus = true;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: widget.isPassword ? obScureStatus : false,
      maxLines: widget.maxLine ?? 1,
      keyboardType: widget.textInputType,
      minLines: widget.minLine,
      validator: widget.validator,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: ColorPalette.blackTextColor,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: ColorPalette.textFormHintTextColor,
        ),
        prefixIcon: widget.prefixWidget,
        prefixIconColor: widget.prefixColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorPalette.textFormBorderColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorPalette.textFormBorderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorPalette.textFormBorderColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorPalette.textFormBorderErrorColor,
            width: 1,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obScureStatus = !obScureStatus;
                  });
                },
                icon: Icon(
                  obScureStatus ? Icons.visibility : Icons.visibility_off,
                  color: ColorPalette.textFormBorderColor,
                ),
              )
            : null,
      ),
    );
  }
}
