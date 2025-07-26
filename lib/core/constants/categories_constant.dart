import 'package:flutter/material.dart';

class CategoriesConstant {
  IconData icon;
  String backgroundImagePath, name;

  CategoriesConstant({
    required this.icon,
    required this.backgroundImagePath,
    required this.name,
  });

  static List<CategoriesConstant> categories = [
    CategoriesConstant(
      icon: Icons.pedal_bike_outlined,
      backgroundImagePath: "",
      name: "Sports",
    ),
    CategoriesConstant(
      icon: Icons.cake_outlined,
      backgroundImagePath: "",
      name: "Birthday",
    ),
    CategoriesConstant(
      icon: Icons.menu_book_rounded,
      backgroundImagePath: "",
      name: "Book Club",
    ),
    CategoriesConstant(
      icon: Icons.gamepad_outlined,
      backgroundImagePath: "",
      name: "Gaming",
    ),
    CategoriesConstant(
      icon: Icons.free_cancellation_outlined,
      backgroundImagePath: "",
      name: "Holiday",
    ),
    CategoriesConstant(
      icon: Icons.fastfood_outlined,
      backgroundImagePath: "",
      name: "Eating",
    ),
    CategoriesConstant(
      icon: Icons.workspace_premium_outlined,
      backgroundImagePath: "",
      name: "Work Shop",
    ),
    CategoriesConstant(
      icon: Icons.museum_outlined,
      backgroundImagePath: "",
      name: "Exhibition",
    ),
  ];
}
