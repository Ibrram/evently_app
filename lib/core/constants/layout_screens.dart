import 'package:evently_task_app/modules/sub_modules/home/home_screen.dart';
import 'package:evently_task_app/modules/sub_modules/love/love_screen.dart';
import 'package:evently_task_app/modules/sub_modules/map/map_screen.dart';
import 'package:evently_task_app/modules/sub_modules/profile/profile_screen.dart';
import 'package:flutter/material.dart';

abstract class LayoutScreens {
  static const List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    LoveScreen(),
    ProfileScreen(),
  ];
}
