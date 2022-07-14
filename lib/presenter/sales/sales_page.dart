import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'widgets/body_sales_page.dart';
import 'widgets/bottom_btn_sales.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final categoryController = TextEditingController();
  final productController = TextEditingController();
  final codeController = TextEditingController();
  final priceController = TextEditingController();
  final descountController = TextEditingController();
  final quantityController = TextEditingController();
  final payController = TextEditingController();
  final totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BodySalesPage(
          categoryController: categoryController,
          productController: productController,
          codeController: codeController,
          priceController: priceController,
          descountController: descountController,
          quantityController: quantityController,
          payController: payController,
          totalController: totalController,
        ),
      ),
      bottomNavigationBar: BottomBtnSales(
        categoryController: categoryController,
        productController: productController,
        codeController: codeController,
        priceController: priceController,
        descountController: descountController,
        quantityController: quantityController,
        payController: payController,
        totalController: totalController,
      ),
    );
  }
}
