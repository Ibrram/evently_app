import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget({
    super.key,
    required this.items,
    // required this.hintText,
  });
  final List<DropdownMenuItem> items;
  // final String hintText;

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  String? selected;
  @override
  void initState() {
    super.initState();
    selected = widget.items.first.value;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: theme.primaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          value: selected,
          items: widget.items,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.primaryColor,
            fontWeight: FontWeight.w700,
          ),
          iconEnabledColor: theme.primaryColor,
          onChanged: (value) {
            setState(() {
              selected = value;
            });
          },
        ),
      ),
    );
  }
}
