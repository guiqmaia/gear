import 'package:flutter/material.dart';

import '../../sales/sales_page.dart';
import '../../shared/widgets/top_bar_app.dart';
import 'wrap_textfield_add_sale.dart';

class BodySalesPage extends StatelessWidget {
  const BodySalesPage({
    Key? key,
    required this.categoryController,
    required this.productController,
    required this.codeController,
    required this.priceController,
    required this.descountController,
    required this.quantityController,
    required this.payController,
    required this.totalController,
  }) : super(key: key);

  final TextEditingController categoryController;
  final TextEditingController productController;
  final TextEditingController codeController;
  final TextEditingController priceController;
  final TextEditingController descountController;
  final TextEditingController quantityController;
  final TextEditingController payController;
  final TextEditingController totalController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const TopBarApp(
          title: 'Adicionar venda',
          pageRoute: SalesPage(),
          isProfile: false,
        ),
        WrapTextFieldSale(
          categoryController: categoryController,
          productController: productController,
          codeController: codeController,
          priceController: priceController,
          descountController: descountController,
          quantityController: quantityController,
          payController: payController,
          totalController: totalController,
        ),
      ],
    );
  }
}
