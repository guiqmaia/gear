import 'package:flutter/material.dart';
import 'package:gear/core/app_getit.dart';
import '../../shared/widgets/btn_standard_app.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/create_database_products.dart';
import '../../cash_register/cash_register_page.dart';
import '../../category/category_page.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  static bool isCreated = false;
  late Material materialButton;
  late int index;

  Future createListProducts() async {
    await CreateDatabaseProducts().createSodas();
    await CreateDatabaseProducts().createBeers();
    await CreateDatabaseProducts().createWines();
    await CreateDatabaseProducts().createDistilled();
    await CreateDatabaseProducts().createEnergyDrink();
    await CreateDatabaseProducts().createWater();
  }

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
                      padding: const EdgeInsets.only(top: 25),
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                          bottomRight: Radius.circular(150),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'GEAR',
                            style: TextStyle(
                              color: Color.fromRGBO(202, 254, 72, 1),
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 30),
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: Image.asset(
                              imgStore,
                              fit: BoxFit.cover,
                            ).image,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 57,
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(25),
                          color: greenNeon,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                logedUser.company,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              logedUser.cnpj,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            Text(logedUser.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnStandardApp(
                      title: "CAIXA",
                      widthBtn: MediaQuery.of(context).size.width * 0.9,
                      heightBtn: MediaQuery.of(context).size.height * 0.1,
                      fontSize: 22,
                      fontColorBtn: greenNeon,
                      backgroundColorBtn: Colors.black,
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
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (!isCreated) {
                            setState(() {
                              createListProducts();
                              isCreated = true;

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CategoryPage(),
                                ),
                              );
                            });
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CategoryPage(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'ESTOQUE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
