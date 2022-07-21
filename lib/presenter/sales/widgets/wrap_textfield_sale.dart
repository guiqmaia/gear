import 'package:flutter/material.dart';
import 'package:gear/infra/database/gear_database.dart';
import 'package:gear/infra/models/product_model.dart';
import 'package:gear/presenter/shared/widgets/text_field_app.dart';

import '../../shared/widgets/dropdown_input.dart';
import '../../shared/widgets/text_field_app_formatted.dart';

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
    listProduct = await GearDatabase.instance.select(category);
    print(category);

    listProduct!.forEach((entry) {
      var newDropdown = DropdownMenuItem(
        child: Text('${entry.name}'),
        value: '{$entry.name}',
      );
      print(entry.name);

      dropDownItems!.add(newDropdown);
    });

    print(dropDownItems);
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
        InkWell(
          onTap: () {
            setState(() {
              getDropdownItems(widget.categoryController.text);
            });
          },
          child: DropDownInput(
            dropdownList: dropDownItems!,
            labelDropdown: 'Produto',
            iconDropdown: Icons.description_rounded,
            selectedValueController: widget.categoryController,
          ),
        ),
        TextFieldApp(
          labelItem: 'Código do produto',
          iconInput: Icons.code_rounded,
          typeController: widget.codeController,
          isObscured: false,
        ),
        TextFieldApp(
          labelItem: 'Preço do produto',
          iconInput: Icons.price_check_rounded,
          typeController: widget.priceController,
          isObscured: false,
        ),
        TextFieldApp(
          labelItem: 'Desconto',
          iconInput: Icons.price_change_rounded,
          typeController: widget.descountController,
          isObscured: false,
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          iconInput: Icons.production_quantity_limits_rounded,
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
          isObscured: false,
        ),
      ],
    );
  }
}
