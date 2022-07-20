import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/create_database_products.dart';
import '../../cash_register/cash_register_page.dart';
import '../../category/category_page.dart';
import '../../shared/widgets/btn_standard_app.dart';
import 'column_profile_info.dart';
import 'decorated_box_chart_results.dart';
import 'top_bar_home.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  static bool isCreated = false;
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
                const TopBarHome(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnStandardApp(
                      title: "Caixa",
                      widthBtn: MediaQuery.of(context).size.width * 0.3,
                      pageRoute: const CashRegisterPage(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greenNeon,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (!isCreated) {
                            setState(() async {
                              await CreateDatabaseProducts().createSodas();
                              await CreateDatabaseProducts().createBeers();
                              await CreateDatabaseProducts().createWines();
                              await CreateDatabaseProducts().createDistilled();
                              await CreateDatabaseProducts()
                                  .createEnergyDrink();
                              await CreateDatabaseProducts().createWater();
                              isCreated = true;

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CategoryPage(),
                                ),
                              );
                            });
                          }

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CategoryPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Estoque',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // BtnStandardApp(
                    //   title: "Estoque",
                    //   widthBtn: MediaQuery.of(context).size.width * 0.3,
                    //   pageRoute: const CategoryPage(),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
