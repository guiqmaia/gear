import 'package:flutter/material.dart';

import '../sales/sales_page.dart';
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
      backgroundColor: Color.fromRGBO(240, 239, 244, 1),
      body: const BodyCashRegister(),
      bottomNavigationBar: BtnStandardApp(
        title: 'Adicionar venda',
        pageRoute: const SalesPage(),
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}
