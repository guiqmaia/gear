import 'package:flutter/material.dart';

import '../../cash_register/cash_register_page.dart';
import '../../category/category_page.dart';
import '../../product_signup/product_signup_page.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.only(bottom: 5),
            padding:
                const EdgeInsets.only(bottom: 30, top: 30, right: 30, left: 10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Center(
              child: Text(
                'Gear',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
                    builder: (context) => const CategoryPage(),
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
    );
  }
}
