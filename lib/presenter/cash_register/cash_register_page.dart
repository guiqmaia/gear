import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../sales/sales_page.dart';
import '../shared/widgets/top_bar_app.dart';

import '../shared/widgets/btn_standard_app.dart';
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
      body: Column(
        children: const [
          TopBarApp(
            title: 'Caixa',
            pageRoute: HomePage(),
            isProfile: true,
          ),
          BodyCashRegister(),
        ],
      ),
      bottomNavigationBar: BtnStandardApp(
        title: 'Adicionar venda',
        pageRoute: const SalesPage(),
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}
