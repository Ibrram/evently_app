import 'package:flutter/material.dart';

class CategoryModel {
  IconData icon;
  String backgroundImagePath, name;

  CategoryModel({
    required this.icon,
    required this.backgroundImagePath,
    required this.name,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      icon: Icons.pedal_bike_outlined,
      backgroundImagePath: "",
      name: "Sports",
    ),
    CategoryModel(
      icon: Icons.cake_outlined,
      backgroundImagePath: "",
      name: "Birthday",
    ),
    CategoryModel(
      icon: Icons.cake_outlined,
      backgroundImagePath: "",
      name: "Book Club",
    ),
    CategoryModel(
      icon: Icons.gamepad_outlined,
      backgroundImagePath: "",
      name: "Gaming",
    ),
    CategoryModel(
      icon: Icons.free_cancellation_outlined,
      backgroundImagePath: "",
      name: "Holiday",
    ),
    CategoryModel(
      icon: Icons.fastfood_outlined,
      backgroundImagePath: "",
      name: "Eating",
    ),
    CategoryModel(
      icon: Icons.workspace_premium_outlined,
      backgroundImagePath: "",
      name: "Work Shop",
    ),
    CategoryModel(
      icon: Icons.museum_outlined,
      backgroundImagePath: "",
      name: "Exhibition",
    ),
  ];
}
