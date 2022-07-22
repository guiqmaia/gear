import 'package:flutter/material.dart';

import '../add_sales/add_sales_page.dart';
import '../../shared/widgets/btn_standard_app.dart';
import 'widgets/body_sales_page.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 239, 244, 1),
      body: const BodyCashRegister(),
      bottomNavigationBar: BtnStandardApp(
        title: 'Adicionar venda',
        pageRoute: const AddSalesPage(),
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}
