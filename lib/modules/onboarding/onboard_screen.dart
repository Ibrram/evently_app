import 'package:evently_task_app/core/constants/app_assets.dart';
import 'package:evently_task_app/core/routes/routes_name.dart';
import 'package:evently_task_app/l10n/app_localizations.dart';
import 'package:evently_task_app/modules/onboarding/widgets/indcator_widget.dart';
import 'package:evently_task_app/modules/onboarding/widgets/onboard_card_view.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentViewIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations lang = AppLocalizations.of(context)!;
    List<Map<String, dynamic>> contents = [
      {
        "title": lang.onboard_1_title,
        "desc": lang.onboard_1_desc,
        "img": AppAssets.onboard_1,
      },
      {
        "title": lang.onboard_2_title,
        "desc": lang.onboard_2_desc,
        "img": AppAssets.onboard_2,
      },
      {
        "title": lang.onboard_3_title,
        "desc": lang.onboard_3_desc,
        "img": AppAssets.onboard_3,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 39, horizontal: 16),
          child: Column(
            spacing: 39,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logoH, height: 50),
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      currentViewIndex = value;
                    });
                  },
                  controller: _pageController,
                  children: [
                    OnboardCardView(content: contents[0]),
                    OnboardCardView(content: contents[1]),
                    OnboardCardView(content: contents[2]),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: currentViewIndex == 0 ? false : true,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _pageController.previousPage(
                            duration: Durations.medium1,
                            curve: Curves.easeIn,
                          );
                        });
                      },
                      style: IconButton.styleFrom(
                        foregroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: theme.primaryColor),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                  IndcatorWidget(
                    length: contents.length,
                    activeIndex: currentViewIndex,
                  ),
                  IconButton(
                    onPressed: () {
                      if (currentViewIndex == contents.length - 1) {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesName.login,
                        );
                      } else {
                        setState(() {
                          _pageController.nextPage(
                            duration: Durations.medium1,
                            curve: Curves.easeIn,
                          );
                        });
                      }
                    },
                    style: IconButton.styleFrom(
                      foregroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: theme.primaryColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_forward_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
