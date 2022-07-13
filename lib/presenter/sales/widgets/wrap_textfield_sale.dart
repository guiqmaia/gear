import 'package:flutter/material.dart';

import 'input_sale_items.dart';

class WrapTextFieldSale extends StatelessWidget {
  const WrapTextFieldSale({
    Key? key,
    required this.codeController,
    required this.descountController,
    required this.priceController,
    required this.quantityController,
    required this.totalController,
  }) : super(key: key);

  final TextEditingController codeController;
  final TextEditingController descountController;
  final TextEditingController priceController;
  final TextEditingController quantityController;
  final TextEditingController totalController;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InputSaleItems(
          labelItem: 'Código do produto',
          iconInput: Icons.code_rounded,
          typeController: codeController,
        ),
        InputSaleItems(
          labelItem: 'Descrição do produto',
          iconInput: Icons.description_rounded,
          typeController: descountController,
        ),
        InputSaleItems(
          labelItem: 'Preço do produto',
          iconInput: Icons.price_check_rounded,
          typeController: priceController,
        ),
        InputSaleItems(
          labelItem: 'Desconto',
          iconInput: Icons.price_change_rounded,
          typeController: descountController,
        ),
        InputSaleItems(
          labelItem: 'Quantidade',
          iconInput: Icons.production_quantity_limits_rounded,
          typeController: quantityController,
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: Colors.black,
        ),
        InputSaleItems(
          labelItem: 'Total',
          iconInput: Icons.attach_money_rounded,
          typeController: totalController,
        ),
      ],
    );
  }
}
