import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'widgets/bottom_btn_sales.dart';
import 'widgets/top_bar_sale.dart';
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
  final totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const TopBarSale(),
            WrapTextFieldSale(
              codeController: codeController,
              descountController: descountController,
              priceController: priceController,
              quantityController: quantityController,
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
        totalController: totalController,
      ),
    );
  }
}


