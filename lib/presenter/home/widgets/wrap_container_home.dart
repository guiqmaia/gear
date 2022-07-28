import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/create_database_products.dart';
import '../../category/category_page.dart';
import '../../sales/sales_page.dart';

class WrapContainerHome extends StatefulWidget {
  const WrapContainerHome({Key? key}) : super(key: key);

  @override
  State<WrapContainerHome> createState() => _WrapContainerHomeState();
}

class _WrapContainerHomeState extends State<WrapContainerHome> {
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
    return Center(
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundGrey,
              image: DecorationImage(
                image: Image.asset('assets/images/bar_chart2.png').image,
                fit: BoxFit.none,
                alignment: Alignment.topRight,
                scale: 2.3,
                //opacity: 0.7,
              ),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.2,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.green.shade600,
                      size: 40,
                    ),
                    const Text(
                      'R\$ 1500,00',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.red,
                      size: 40,
                    ),
                    Text(
                      'R\$ 1500,00',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imgCoins),
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.2,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 10,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SalesPage(),
                  ),
                );
              },
              style: const ButtonStyle(
                alignment: Alignment.centerLeft,
              ),
              child: const Text(
                'CAIXA',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imgInventory),
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.2,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 10,
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
              style: const ButtonStyle(
                alignment: Alignment.centerLeft,
              ),
              child: const Text(
                'ESTOQUE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
