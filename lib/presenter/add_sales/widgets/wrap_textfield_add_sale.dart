import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import 'package:gear/core/app_assets.dart';

import '../../../infra/database/gear_database.dart';
import '../../../infra/models/category_model.dart';
import '../../../infra/models/product_model.dart';
import '../../../shared/widgets/dropdown_input.dart';
import '../../../shared/widgets/text_field_app.dart';

class WrapTextFieldSale extends StatefulWidget {
  WrapTextFieldSale({
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
  double? total;

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

  int? quantity;
  double? descount;
  int? id;

  refreshTotal(quantity, descount) {
    widget.total = (product!.price * quantity) * (1 - descount / 100);
    widget.totalController.text = widget.total.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IgnorePointer(
          ignoring: product != null ? true : false,
          child: DropDownInput(
            dropdownList: dropDownItemsCategories,
            labelDropdown: 'Categoria',
            iconDropdown: Icons.sell_rounded,
            selectedValueController: widget.categoryController,
          ),
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
          isEnabled: product == null,
        ),
        TextFieldApp(
          labelItem: 'Preço do produto',
          typeController: widget.priceController,
          isObscured: false,
          isEnabled: product == null,
        ),
        TextFieldApp(
          labelItem: 'Desconto (R\$)',
          typeController: widget.descountController,
          isObscured: false,
          onChanged: (text) {
            descount = double.parse(text);
          },
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: widget.quantityController,
          isObscured: false,
          onChanged: (text) {
            quantity = int.parse(text);
          },
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                refreshTotal(quantity, descount);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                primary: greenNeon,
                backgroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: const Text('Calcular total'),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                widget.total == null ? '' : 'R\$ ${widget.total}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
