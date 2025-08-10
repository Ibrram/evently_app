import 'package:evently_task_app/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget({
    super.key,
    required this.items,
    this.selected,
    required this.onChanged,
  });
  final List<DropdownMenuItem> items;
  final String? selected;
  final Function(String? value)? onChanged;

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  late AppProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<AppProvider>(context, listen: false);
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
          value: widget.selected,
          items: widget.items,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.primaryColor,
            fontWeight: FontWeight.w700,
          ),
          iconEnabledColor: theme.primaryColor,
          onChanged: (value) {
            widget.onChanged!(value);
          },
        ),
      ),
    );
  }
}
