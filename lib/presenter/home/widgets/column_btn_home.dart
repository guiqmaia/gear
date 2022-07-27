import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/create_database_products.dart';
import '../../../shared/widgets/btn_standard_app.dart';
import '../../category/category_page.dart';
import '../../sales/sales_page.dart';

class ColumnBtnHome extends StatefulWidget {
  const ColumnBtnHome({Key? key}) : super(key: key);

  @override
  State<ColumnBtnHome> createState() => _ColumnBtnHomeState();
}

class _ColumnBtnHomeState extends State<ColumnBtnHome> {
  static bool isCreated = false;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnStandardApp(
          title: "CAIXA",
          widthBtn: MediaQuery.of(context).size.width * 0.9,
          heightBtn: MediaQuery.of(context).size.height * 0.1,
          fontSize: 21,
          fontColorBtn: greenNeon,
          backgroundColorBtn: Colors.black,
          pageRoute: SalesPage(),
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
                setState(
                  () {
                    createListProducts();
                    isCreated = true;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CategoryPage(),
                      ),
                    );
                  },
                );
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
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
