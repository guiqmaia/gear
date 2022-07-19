import 'package:flutter/material.dart';
import 'package:gear/presenter/shared/widgets/btn_standard_app.dart';
import '../../../core/app_assets.dart';
import 'package:onboarding/onboarding.dart';

import '../../cash_register/cash_register_page.dart';
import '../../category/category_page.dart';
import '../../results/results_page.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: Image.asset(
                "assets/images/fotoConveniencia.png",
                fit: BoxFit.cover,
              ).image,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Destribuidora Bebidinhas',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '27.042.017/00001-22',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Douglas Costa da Silva',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
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
                vertical: 10,
                horizontal: 10,
              ),
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
                  height: 300,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BtnStandardApp(
                      title: "Caixa",
                      widthBtn: MediaQuery.of(context).size.width * 0.4,
                      pageRoute: const CashRegisterPage(),
                    ),
                    BtnStandardApp(
                      title: "Estoque",
                      widthBtn: MediaQuery.of(context).size.width * 0.4,
                      pageRoute: const CategoryPage(),
                    ),
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
