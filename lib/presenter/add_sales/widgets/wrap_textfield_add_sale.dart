import 'package:flutter/material.dart';

import '../../../infra/database/gear_database.dart';
import '../../../infra/models/category_model.dart';
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
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  List<DropdownMenuItem<String>> dropDownItemsCategories = [];
  List<DropdownMenuItem<String>> dropDownItemsProducts = [];
  String? categoryValue;
  ProductModel? product;

  @override
  void initState() {
    super.initState();
    refreshCategories();
  }

  Future refreshCategories() async {
    categories = await GearDatabase.instance.selectCategories();
    for (CategoryModel categoryModel in categories) {
      dropDownItemsCategories.add(
        DropdownMenuItem(
          value: categoryModel.id.toString(),
          child: Text(categoryModel.name),
          onTap: () {
            widget.codeController.clear();
            widget.priceController.clear();
            refreshProducts(categoryModel.id!);
          },
        ),
      );
    }
    setState(() {});
  }

  Future refreshProducts(int categoryId) async {
    dropDownItemsProducts.clear();
    products = await GearDatabase.instance.selectProductsByCategory(categoryId);
    for (ProductModel productModel in products) {
      dropDownItemsProducts.add(
        DropdownMenuItem(
          value: productModel.id.toString(),
          child: Text(productModel.name),
          onTap: () {
            getProductById(productModel.id!);
          },
        ),
      );
    }
    setState(() {});
  }

  Future getProductById(int id) async {
    product = await GearDatabase.instance.selectProductById(id);
    widget.codeController.text = product!.id.toString();
    widget.priceController.text = product!.price.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        DropDownInput(
          dropdownList: dropDownItemsCategories,
          labelDropdown: 'Categoria',
          iconDropdown: Icons.sell_rounded,
          selectedValueController: widget.categoryController,
        ),
        DropDownInput(
          dropdownList: dropDownItemsProducts,
          labelDropdown: 'Produto',
          iconDropdown: Icons.description_rounded,
          selectedValueController: widget.productController,
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
