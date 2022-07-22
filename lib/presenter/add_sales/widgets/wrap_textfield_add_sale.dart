import 'package:flutter/material.dart';

import '../../../infra/database/gear_database.dart';
import '../../../infra/models/product_model.dart';
import '../../../shared/widgets/dropdown_input.dart';
import '../../../shared/widgets/text_field_app.dart';

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
  List<ProductModel>? listProduct;
  List<DropdownMenuItem<String>>? dropDownItems = [];
  String? categoryValue;

  Future<List<DropdownMenuItem<String>>> getDropdownItems(category) async {
    listProduct =
        await GearDatabase.instance.selectProductsByCategory(category);

    listProduct!.forEach(
      (entry) {
        var newDropdown = DropdownMenuItem(
          child: Text('${entry.name}'),
          value: '{$entry.name}',
        );

        dropDownItems!.add(newDropdown);
      },
    );

    return dropDownItems!;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        DropDownInput(
          dropdownList: const [
            DropdownMenuItem(
                value: 'Refrigerante', child: Text('Refrigerante')),
            DropdownMenuItem(value: 'Cerveja', child: Text('Cerveja')),
            DropdownMenuItem(value: 'Vinho', child: Text('Vinho')),
            DropdownMenuItem(value: 'Destilado', child: Text('Destilado')),
            DropdownMenuItem(value: 'Energético', child: Text('Energético')),
            DropdownMenuItem(value: 'Água', child: Text('Água')),
          ],
          labelDropdown: 'Categoria',
          iconDropdown: Icons.sell_rounded,
          selectedValueController: widget.categoryController,
        ),
        DropDownInput(
          dropdownList: const [
            DropdownMenuItem(value: 'Produto', child: Text('Produto')),
          ],
          labelDropdown: 'Produto',
          iconDropdown: Icons.description_rounded,
          selectedValueController: widget.categoryController,
        ),
        TextFieldApp(
          labelItem: 'Código do produto',
          typeController: widget.codeController,
          isObscured: false,
        ),
        TextFieldApp(
          labelItem: 'Preço do produto',
          typeController: widget.priceController,
          isObscured: false,
        ),
        TextFieldApp(
          labelItem: 'Desconto',
          typeController: widget.descountController,
          isObscured: false,
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: widget.quantityController,
          isObscured: false,
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
          selectedValueController: widget.payController,
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: Colors.black,
        ),
        TextFieldApp(
          labelItem: 'Total',
          typeController: widget.totalController,
          isObscured: false,
        ),
      ],
    );
  }
}
