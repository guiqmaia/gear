import 'package:flutter/material.dart';
import 'package:gear/presenter/home/home_page.dart';
import 'package:gear/presenter/shared/widgets/top_bar_app.dart';

import 'widgets/adding_new_sales.dart';
import 'widgets/body_cash_register.dart';

class CashRegisterPage extends StatefulWidget {
  const CashRegisterPage({Key? key}) : super(key: key);

  @override
  State<CashRegisterPage> createState() => _CashRegisterPageState();
}

class _CashRegisterPageState extends State<CashRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Column(
        children: const [
          TopBarApp(
            title: 'Caixa registradora',
            pageRoute: HomePage(),
          ),
          BodyCashRegister(),
        ],
      ),
      bottomNavigationBar: const AddingNewSales(),
    );
  }
}
