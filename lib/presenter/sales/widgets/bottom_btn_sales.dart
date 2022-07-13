import 'package:flutter/material.dart';

import 'package:gear/presenter/sales/widgets/wrap_textfield_sale.dart';

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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () {
              //createSale();
            },
            child: const Text(
              'Finalizar venda',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue,
                child: IconButton(
                  tooltip: 'Adicione',
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white.withOpacity(0.8),
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
                  icon: const Icon(
                    Icons.clear_all_rounded,
                    color: Colors.blue,
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
