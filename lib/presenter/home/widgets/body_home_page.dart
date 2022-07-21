import 'package:flutter/material.dart';
import 'package:gear/presenter/shared/widgets/btn_standard_app.dart';
import 'package:onboarding/onboarding.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/create_database_products.dart';
import '../../cash_register/cash_register_page.dart';
import '../../category/category_page.dart';
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
                Stack(
                  children: [
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                          bottomRight: Radius.circular(150),
                        ),
                      ),
                      child: Column(children: [
                        const Text('Gear'),
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: Image.asset(
                            imgStore,
                            fit: BoxFit.cover,
                          ).image,
                        ),
                      ]),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: greenNeon,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'Distribuidora Bebidinhas',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '27.042.017/00001-22',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            Text('Douglas Costa da Silva',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
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
