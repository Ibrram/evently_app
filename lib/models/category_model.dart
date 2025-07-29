import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  IconData icon;
  String backgroundImage;
  CategoryModel({
    required this.name,
    required this.icon,
    required this.backgroundImage,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      icon: Icons.pedal_bike_outlined,
      backgroundImage: AppAssets.sportEventBackground,
      name: "Sport",
    ),
    CategoryModel(
      icon: Icons.cake_outlined,
      backgroundImage: AppAssets.birthDayEventBackground,
      name: "Birthday",
    ),
    CategoryModel(
      icon: Icons.menu_book_rounded,
      backgroundImage: AppAssets.bookClubEventBackground,
      name: "Book Club",
    ),
    CategoryModel(
      icon: Icons.video_chat_outlined,
      backgroundImage: AppAssets.meetingEventBackground,
      name: "Meeting",
    ),
    CategoryModel(
      icon: Icons.gamepad_outlined,
      backgroundImage: AppAssets.gamingEventBackground,
      name: "Gaming",
    ),
    CategoryModel(
      icon: Icons.free_cancellation_outlined,
      backgroundImage: AppAssets.holidayEventBackground,
      name: "Holiday",
    ),
    CategoryModel(
      icon: Icons.fastfood_outlined,
      backgroundImage: AppAssets.eatingEventBackground,
      name: "Eating",
    ),
    CategoryModel(
      icon: Icons.workspace_premium_outlined,
      backgroundImage: AppAssets.workShopEventBackground,
      name: "Work Shop",
    ),
    CategoryModel(
      icon: Icons.museum_outlined,
      backgroundImage: AppAssets.exhibitionEventBackground,
      name: "Exhibition",
    ),
  ];
}
