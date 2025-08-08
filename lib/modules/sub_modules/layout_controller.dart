import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/constants/layout_screens.dart';
import 'package:evently_task_app/core/routes/routes_name.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LayoutController extends StatefulWidget {
  const LayoutController({super.key});

  @override
  State<LayoutController> createState() => _LayoutControllerState();
}

class _LayoutControllerState extends State<LayoutController> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.createEvent);
        },
        backgroundColor: Colors.white,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(75),
        ),
        child: Container(
          margin: const EdgeInsets.all(4.0),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(75),
          ),
          child: const Icon(
            Icons.add,
            color: ColorPalette.scaffoldBackground,
            size: 24,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppAssets.homeIcon)),
            activeIcon: const ImageIcon(AssetImage(AppAssets.homeFillIcon)),
            label: lang.home,
          ),

          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppAssets.mapIcon)),
            activeIcon: const ImageIcon(AssetImage(AppAssets.mapFillIcon)),
            label: lang.map,
          ),

          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppAssets.favIcon)),
            activeIcon: const ImageIcon(AssetImage(AppAssets.favFillIcon)),
            label: lang.love,
          ),

          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppAssets.profileIcon)),
            activeIcon: const ImageIcon(AssetImage(AppAssets.profileFillIcon)),
            label: lang.profile,
          ),
        ],
      ),
      body: LayoutScreens.screens[currentIndex],
    );
  }
}
