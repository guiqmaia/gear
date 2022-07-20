import 'package:flutter/material.dart';
import 'package:gear/presenter/shared/widgets/big_text_app.dart';
import 'package:gear/presenter/shared/widgets/btn_standard_app.dart';
import '../../../core/app_assets.dart';
import 'package:onboarding/onboarding.dart';

import '../../../infra/database/create_database_products.dart';
import '../../cash_register/cash_register_page.dart';
import '../../category/category_page.dart';
import '../../results/results_page.dart';

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
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: Image.asset(
                    imgStore,
                    fit: BoxFit.cover,
                  ).image,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Drinks && Company',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '27.042.017/00001-22',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text('Douglas Costa da Silva',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundGrey,
          border: Border.all(
            width: 0.0,
            color: backgroundGrey,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: const BarChartSample1(),
            ),
          ],
        ),
      ),
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
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.only(
                      bottom: 20, top: 20, right: 30, left: 10),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Gear',
                      style: TextStyle(
                        color: Color.fromRGBO(202, 254, 72, 1),
                        fontSize: 29,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
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
                              borderWidth: 1.5,
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
