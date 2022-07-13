import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../cash_register/cash_register_page.dart';
import '../shared/widgets/top_bar_app.dart';
import 'widgets/bottom_btn_sales.dart';
import 'widgets/wrap_textfield_sale.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final codeController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final descountController = TextEditingController();
  final quantityController = TextEditingController();
  final payController = TextEditingController();
  final totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const TopBarApp(
              title: 'Adicionar venda',
              pageRoute: CashRegisterPage(),
            ),
            WrapTextFieldSale(
              codeController: codeController,
              descriptionController: descriptionController,
              priceController: priceController,
              descountController: descountController,
              quantityController: quantityController,
              payController: payController,
              totalController: totalController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBtnSales(
        codeController: codeController,
        descriptionController: descriptionController,
        priceController: priceController,
        descountController: descountController,
        quantityController: quantityController,
        payController: payController,
        totalController: totalController,
      ),
    );
  }
}
