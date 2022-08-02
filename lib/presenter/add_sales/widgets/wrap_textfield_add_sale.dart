import 'package:flutter/material.dart';
import 'package:gear/presenter/add_sales/widgets/focus_node_add_sales.dart';

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
  CategoryModel? category;
  double? total;

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
            category = categoryModel;
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
    descount != null
        ? total = (product!.price * quantity) * (1 - descount / 100)
        : total = (product!.price * quantity);
    widget.totalController.text = total.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        IgnorePointer(
          ignoring: category != null ? true : false,
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
          focus: focusNodeCodeAddSalesPage,
          nextFocus: focusPriceAddSalesPage,
        ),
        TextFieldApp(
          labelItem: 'Preço do produto',
          typeController: widget.priceController,
          isObscured: false,
          focus: focusPriceAddSalesPage,
          nextFocus: focusDiscountAddSalesPage,
        ),
        TextFieldApp(
          labelItem: 'Desconto (%)',
          typeController: widget.descountController,
          isObscured: false,
          focus: focusDiscountAddSalesPage,
          nextFocus: focusQuantityAddSalesPage,
          onChanged: (text) {
            descount = double.parse(text);
            refreshTotal(quantity, descount);
          },
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: widget.quantityController,
          isObscured: false,
          focus: focusQuantityAddSalesPage,
          onChanged: (text) {
            quantity = int.parse(text);
            refreshTotal(quantity, descount);
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
        Container(
          width: MediaQuery.of(context).size.width * 0.91,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total: ',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                total == null ? '' : 'R\$ ${total!.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
