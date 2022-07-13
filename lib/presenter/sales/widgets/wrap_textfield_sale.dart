import 'package:flutter/material.dart';
import 'package:gear/presenter/sales/widgets/dropdown_input_sales.dart';

import 'input_sale_items.dart';

class WrapTextFieldSale extends StatefulWidget {
  const WrapTextFieldSale({
    Key? key,
    required this.codeController,
    required this.descriptionController,
    required this.descountController,
    required this.priceController,
    required this.quantityController,
    required this.payController,
    required this.totalController,
  }) : super(key: key);

  final TextEditingController codeController;
  final TextEditingController descriptionController;
  final TextEditingController descountController;
  final TextEditingController priceController;
  final TextEditingController quantityController;
  final TextEditingController payController;
  final TextEditingController totalController;

  @override
  State<WrapTextFieldSale> createState() => _WrapTextFieldSaleState();
}

class _WrapTextFieldSaleState extends State<WrapTextFieldSale> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InputSaleItems(
          labelItem: 'Código do produto',
          iconInput: Icons.code_rounded,
          typeController: widget.codeController,
        ),
        InputSaleItems(
          labelItem: 'Descrição do produto',
          iconInput: Icons.description_rounded,
          typeController: widget.descriptionController,
        ),
        InputSaleItems(
          labelItem: 'Preço do produto',
          iconInput: Icons.price_check_rounded,
          typeController: widget.priceController,
        ),
        InputSaleItems(
          labelItem: 'Desconto',
          iconInput: Icons.price_change_rounded,
          typeController: widget.descountController,
        ),
        InputSaleItems(
          labelItem: 'Quantidade',
          iconInput: Icons.production_quantity_limits_rounded,
          typeController: widget.quantityController,
        ),
        const DropDownInputSale(),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: Colors.black,
        ),
        InputSaleItems(
          labelItem: 'Total',
          iconInput: Icons.attach_money_rounded,
          typeController: widget.totalController,
        ),
      ],
    );
  }
}
