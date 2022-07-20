import 'package:flutter/material.dart';

import '../../shared/widgets/dropdown_input.dart';
import '../../shared/widgets/text_field_app.dart';

class WrapTextFieldSale extends StatefulWidget {
  const WrapTextFieldSale({
    Key? key,
    required this.categoryController,
    required this.codeController,
    required this.productController,
    required this.priceController,
    required this.descountController,
    required this.quantityController,
    required this.payController,
    required this.totalController,
  }) : super(key: key);

  final TextEditingController categoryController;
  final TextEditingController codeController;
  final TextEditingController productController;
  final TextEditingController priceController;
  final TextEditingController descountController;
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
        DropDownInput(
          dropdownList: [
            DropdownMenuItem(value: 'Tênis', child: Text('Tênis')),
            DropdownMenuItem(value: 'Camiseta', child: Text('Camiseta')),
            DropdownMenuItem(value: 'Casaco', child: Text('Casaco')),
            DropdownMenuItem(value: 'Calça', child: Text('Calça')),
          ],
          labelDropdown: 'Categoria',
          iconDropdown: Icons.sell_rounded,
          selectedValueController: widget.categoryController,
        ),
        DropDownInput(
          dropdownList: [
            DropdownMenuItem(value: 'Produto', child: Text('Produto')),
            DropdownMenuItem(value: 'Produto2', child: Text('Produto2')),
          ],
          labelDropdown: 'Produto',
          iconDropdown: Icons.description_rounded,
          selectedValueController: widget.categoryController,
        ),
        TextFieldApp(
          labelItem: 'Código do produto',
          iconInput: Icons.code_rounded,
          typeController: widget.codeController,
        ),
        TextFieldApp(
          labelItem: 'Preço do produto',
          iconInput: Icons.price_check_rounded,
          typeController: widget.priceController,
        ),
        TextFieldApp(
          labelItem: 'Desconto',
          iconInput: Icons.price_change_rounded,
          typeController: widget.descountController,
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          iconInput: Icons.production_quantity_limits_rounded,
          typeController: widget.quantityController,
        ),
        DropDownInput(
          dropdownList: const [
            DropdownMenuItem(value: 'Crédito', child: Text('Crédito')),
            DropdownMenuItem(value: 'Débito', child: Text('Débito')),
            DropdownMenuItem(value: 'Dinheiro', child: Text('Dinheiro')),
            DropdownMenuItem(value: 'PIX', child: Text('PIX')),
          ],
          labelDropdown: 'Modo de pagamento',
          iconDropdown: Icons.credit_card_rounded,
          selectedValueController: widget.categoryController,
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: Colors.black,
        ),
        TextFieldApp(
          labelItem: 'Total',
          iconInput: Icons.attach_money_rounded,
          typeController: widget.totalController,
        ),
      ],
    );
  }
}
