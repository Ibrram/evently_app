import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);

    return Scaffold(appBar: AppBar(title: const Text('Create Event')));
  }

  String getImagePathByCategoryName(String categoryName) {
    switch (categoryName) {
      case 'Sport':
        return AppAssets.sportEventBackground;
      case 'Birthday':
        return AppAssets.birthDayEventBackground;
      case 'Book Club':
        return AppAssets.bookClubEventBackground;
      case 'Meeting':
        return AppAssets.meetingEventBackground;
      case 'Gaming':
        return AppAssets.gamingEventBackground;
      case 'Holiday':
        return AppAssets.holidayEventBackground;
      case 'Eating':
        return AppAssets.eatingEventBackground;
      case 'Work Shop':
        return AppAssets.workShopEventBackground;
      case 'Exhibition':
        return AppAssets.exhibitionEventBackground;
    }
    return AppAssets.sportEventBackground;
  }
}
