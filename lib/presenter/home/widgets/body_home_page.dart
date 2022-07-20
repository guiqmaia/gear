import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import 'package:onboarding/onboarding.dart';
import 'column_profile_info.dart';
import 'columns_buttons.dart';
import 'decorated_box_chart_results.dart';
import 'top_bar_home.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundGrey,
          border: Border.all(
            width: 0,
            color: backgroundGrey,
          ),
        ),
        child: const ColumnProfileInfo(),
      ),
    ),
    PageModel(
      widget: const DecoratedBoxChartResults(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopBarHome(),
                Container(
                  alignment: Alignment.center,
                  color: Colors.grey.shade400,
                  width: double.infinity,
                  height: 350,
                  child: Onboarding(
                    pages: onboardingPagesList,
                    onPageChange: (int pageIndex) {
                      index = pageIndex;
                    },
                    startPageIndex: 0,
                    footerBuilder:
                        (context, dragDistance, pagesLength, setIndex) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 35, 0),
                        child: CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                            activeIndicator: const ActiveIndicator(
                                color: Colors.black,
                                borderWidth: 1.4,
                                ),
                            closedIndicator: ClosedIndicator(color: greenNeon),
                            indicatorDesign: IndicatorDesign.polygon(
                              polygonDesign: PolygonDesign(
                                polygon: DesignType.polygon_circle,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ColumnButtons(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
