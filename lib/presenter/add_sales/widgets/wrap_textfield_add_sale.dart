import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/database/gear_database.dart';
import '../../../infra/models/product_model.dart';
import '../../../infra/providers/sale_providers.dart';
import '../../../shared/widgets/dropdown_input.dart';
import '../../../shared/widgets/text_field_app.dart';
import '../../category/widgets/wrap_container_category.dart';

class WrapTextFieldSale extends StatefulHookConsumerWidget {
  const WrapTextFieldSale({Key? key}) : super(key: key);

  @override
  ConsumerState<WrapTextFieldSale> createState() => _WrapTextFieldSaleState();
}

class _WrapTextFieldSaleState extends ConsumerState<WrapTextFieldSale> {
  List<ProductModel> listProducts = [];
  double? total;

  Future<List<ProductModel>> refreshProducts(int id) async {
    listProducts = await GearDatabase.instance.selectProductsByCategory(id);
    setState(() {});
    return listProducts;
  }

  void refreshTotal(
    TextEditingController qntController,
    TextEditingController discController,
    TextEditingController priceController,
    TextEditingController totalController,
  ) {
    if (discController.text == '' || discController.text == 0) {
      total =
          (double.parse(priceController.text) * int.parse(qntController.text));
    } else {
      total =
          (double.parse(priceController.text) * int.parse(qntController.text)) *
              (1 - (double.parse(discController.text) / 100));
    }
    totalController.text = total.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final categoryController = ref.watch(categoryControllerProvider.state);
    final productController = ref.watch(productControllerProvider.state);
    final codeController = ref.watch(productCodeControllerProvider.state);
    final quantityController = ref.watch(quantityControllerProvider.state);
    final paymentController = ref.watch(paymentControllerProvider.state);
    final priceController = ref.watch(priceControllerProvider.state);
    final discountController = ref.watch(discountControllerProvider.state);
    final totalController = ref.watch(totalControllerProvider.state);

    final listCategories = ref.watch(categoryNotifier);

    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Visibility(
          visible: listCategories.isNotEmpty,
          replacement: const CircularProgressIndicator(),
          child: Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Categoria',
                prefixIcon: const Icon(
                  Icons.sell_rounded,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (String? selectedValue) {
                categoryController.state.text = selectedValue!;
              },
              items: listCategories.map((category) {
                return DropdownMenuItem<String>(
                  value: category.id.toString(),
                  child: Text(category.name),
                  onTap: () {
                    setState(() {
                      refreshProducts(category.id!);
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
       IgnorePointer(
          ignoring: listProducts.isNotEmpty ? false : true,
          child: Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Produtos',
                prefixIcon: const Icon(
                  Icons.description_rounded,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (String? selectedValue) {
                setState(() {
                  productController.state.text = selectedValue!;
                });
              },
              items: listProducts.map((product) {
                return DropdownMenuItem<String>(
                  value: product.name,
                  child: Text(product.name),
                  onTap: () {
                    codeController.state.text = product.id.toString();
                    priceController.state.text = product.price.toString();
                  },
                );
              }).toList(),
            ),
          ),
        ),
        TextFieldApp(
          labelItem: 'Código do produto',
          typeController: codeController.state,
          isObscured: false,
          //isEnabled: product == null,
        ),
        TextFieldApp(
          labelItem: 'Preço do produto',
          typeController: priceController.state,
          isObscured: false,
          //isEnabled: product == null,
        ),
        TextFieldApp(
          labelItem: 'Desconto (%)',
          typeController: discountController.state,
          isObscured: false,
          onChanged: (text) {
            refreshTotal(
              quantityController.state,
              discountController.state,
              priceController.state,
              totalController.state,
            );
          },
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: quantityController.state,
          isObscured: false,
          onChanged: (text) {
            refreshTotal(
              quantityController.state,
              discountController.state,
              priceController.state,
              totalController.state,
            );
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
          selectedValueController: paymentController.state,
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          height: 20,
          thickness: 0.7,
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
