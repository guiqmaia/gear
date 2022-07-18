import 'package:flutter/material.dart';
import '../../../core/app_assets.dart';
import 'package:onboarding/onboarding.dart';

import '../../cash_register/cash_register_page.dart';
import '../../category/category_page.dart';

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
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: Image.asset(
                "assets/images/fotoConveniencia.png",
                fit: BoxFit.cover,
              ).image,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Texto',
                style: pageInfoStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'R\$1000',
                style: pageInfoStyle,
                textAlign: TextAlign.left,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Valor Faturado na Semana',
                style: pageInfoStyle,
                textAlign: TextAlign.left,
              ),
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
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.only(
                  bottom: 30, top: 30, right: 30, left: 10),
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
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              height: 300,
              child: Onboarding(
                pages: onboardingPagesList,
                onPageChange: (int pageIndex) {
                  index = pageIndex;
                },
                startPageIndex: 0,
                footerBuilder: (context, dragDistance, pagesLength, setIndex) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        width: 0,
                        color: Colors.black,
                      ),
                    ),
                    child: ColoredBox(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIndicator(
                              netDragPercent: dragDistance,
                              pagesLength: pagesLength,
                              indicator: Indicator(
                                activeIndicator: const ActiveIndicator(
                                  color: Colors.white,
                                  borderWidth: 1.5,
                                ),
                                closedIndicator:
                                    ClosedIndicator(color: greenNeon),
                                indicatorDesign: IndicatorDesign.polygon(
                                  polygonDesign: PolygonDesign(
                                    polygon: DesignType.polygon_circle,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CashRegisterPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: greenNeon,
                ),
                child: const Text(
                  'Registro de Caixa',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CategoryPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: greenNeon,
                ),
                child: const Text(
                  'Gerenciamento de Estoque',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
