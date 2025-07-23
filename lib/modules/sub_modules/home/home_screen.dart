import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/theme_manager/color_palette.dart';
import 'package:evently_task_app/modules/sub_modules/home/models/category_model.dart';
import 'package:evently_task_app/modules/sub_modules/home/widgets/tab_item_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: SafeArea(
            child: Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back ✨',
                          style: theme.textTheme.bodySmall,
                        ),
                        Text(
                          'John Safwat',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 11.5),
                        Row(
                          children: [
                            const ImageIcon(
                              AssetImage(AppAssets.mapIcon),
                              color: ColorPalette.scaffoldBackground,
                            ),
                            Text(
                              'Cairo , Egypt',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        const Icon(
                          Icons.wb_sunny_outlined,
                          color: ColorPalette.scaffoldBackground,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: ColorPalette.scaffoldBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'EN',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                DefaultTabController(
                  length: CategoryModel.categories.length,
                  child: TabBar(
                    onTap: (value) {
                      setState(() {
                        currentCategoryIndex = value;
                      });
                      print(currentCategoryIndex);
                    },
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.transparent,
                    labelPadding: EdgeInsets.zero,
                    tabs: CategoryModel.categories.map((data) {
                      currentCategoryIndex;
                      return TabItemWidget(
                        category: data,
                        isActive:
                            CategoryModel.categories.indexOf(data) ==
                            currentCategoryIndex,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
