import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_add_sales_page.dart';
import 'widgets/bottom_btn_add_sales.dart';

class AddSalesPage extends StatefulWidget {
  const AddSalesPage({Key? key}) : super(key: key);

  static const route = '/sales/add';

  @override
  State<AddSalesPage> createState() => _AddSalesPageState();
}

class _AddSalesPageState extends State<AddSalesPage> {
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
      backgroundColor: backgroundGrey,
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
