import 'package:flutter/material.dart';
import 'package:gear/core/app_assets.dart';

import '../../cash_register/cash_register_page.dart';
import '../../category/category_page.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({Key? key}) : super(key: key);

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
              height: 200,
              width: MediaQuery.of(context).size.width * 0.85,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(5),
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      width: 340),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
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
