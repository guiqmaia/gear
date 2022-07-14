import 'package:flutter/material.dart';
import '../../cash_register/cash_register_page.dart';

import 'wrap_textfield_sale.dart';
import '../../shared/widgets/btn_standard_app.dart';

import '../../cash_register/widgets/sale_register_container.dart';

class BottomBtnSales extends StatelessWidget {
  const BottomBtnSales({
    Key? key,
    required this.codeController,
    required this.descriptionController,
    required this.priceController,
    required this.descountController,
    required this.quantityController,
    required this.payController,
    required this.totalController,
  }) : super(key: key);

  final TextEditingController codeController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController descountController;
  final TextEditingController quantityController;
  final TextEditingController payController;
  final TextEditingController totalController;

  void createSale() {
    SaleRegisterContainer(
      price: totalController.text,
      quantity: quantityController.value,
      product: descriptionController.text,
      productImg: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BtnStandardApp(
          title: 'Finalizar venda',
          pageRoute: const CashRegisterPage(),
          widthBtn: MediaQuery.of(context).size.width * 0.45,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue.shade700,
                child: IconButton(
                  tooltip: 'Adicione',
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                  tooltip: 'Limpar',
                  onPressed: () {
                    codeController.clear();
                    descriptionController.clear();
                    priceController.clear();
                    descountController.clear();
                    quantityController.clear();
                    totalController.clear();
                  },
                  icon: Icon(
                    Icons.clear_all_rounded,
                    color: Colors.blue.shade700,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
