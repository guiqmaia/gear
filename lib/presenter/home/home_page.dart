import 'package:flutter/material.dart';
import '../product_signup/product_signup_page.dart';
import '../results/results_page.dart';

import '../cash_register/cash_register_page.dart';
import '../inventory/inventory_page.dart';
import '../profile/profile.dart';
import 'widget/barNavegation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GEAR'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.25,
              color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CashRegisterPage(),
                    ),
                  );
                },
                child: const Text('Registro de Caixa'),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.25,
              color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InventoryPage(),
                    ),
                  );
                },
                child: const Text('Gerenciamento de Estoque'),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.25,
              color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProductSignupPage(),
                    ),
                  );
                },
                child: const Text('Cadastro de Produto'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
      bottomNavigationBar: BarNavegation(context),
    );
  }
}
