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
  bool isVisible = true;

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
              vertical: 15,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isVisible
                    ? const Text(
                        'R\$ 1500,00',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : const Text(
                        'R\$ *******',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                const SizedBox(height: 10),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (isVisible == true) {
                          isVisible = false;
                        } else {
                          isVisible = true;
                        }
                      });
                    },
                    child: isVisible
                        ? const Icon(
                            Icons.visibility_outlined,
                            color: Color.fromRGBO(46, 67, 86, 1),
                            size: 35,
                          )
                        : const Icon(
                            Icons.visibility_off_outlined,
                            color: Color.fromRGBO(46, 67, 86, 1),
                            size: 35,
                          )),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(244, 144, 140, 1),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.18,
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
              child: const Text(
                'CAIXA',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(204, 225, 52, 1),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.18,
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
              child: const Text(
                'ESTOQUE',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 32,
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
