import 'package:flutter/material.dart';
import 'package:gear/presenter/category/widgets/wrap_container_category.dart';
import 'package:gear/presenter/product/widgets/body_product_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/database/gear_database.dart';
import '../../../infra/models/product_model.dart';
import '../../../infra/providers/sale_providers.dart';
import '../../../shared/widgets/dropdown_input.dart';
import '../../../shared/widgets/text_field_app.dart';

class WrapTextFieldSale extends StatefulHookConsumerWidget {
  const WrapTextFieldSale({Key? key}) : super(key: key);

  @override
  ConsumerState<WrapTextFieldSale> createState() => _WrapTextFieldSaleState();
}

class _WrapTextFieldSaleState extends ConsumerState<WrapTextFieldSale> {
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
    final listProducts = ref.watch(productNotifier);

    double? total;
    int? quantity;
    double? discount;

    ProductModel? product;

    Future getProductById(int id) async {
      product = await GearDatabase.instance.selectProductById(id);
      codeController.state.text = product!.id.toString();
      priceController.state.text = product!.price.toString();
    }

    refreshTotal(quantity, discount) {
      discount != null || discount != 0
          ? total = (product!.price * quantity!) * (1 - discount / 100)
          : total = (product!.price * quantity!);
      totalController.state.text = total.toString();
    }

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
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (String? selectedValue) {
                // setState(() {
                //   widget.selectedValueController.text = selectedValue!;
                // });
              },
              items: listCategories.map((category) {
                return DropdownMenuItem<String>(child: Text(category.name));
              }).toList(),
            ),
          ),
        ),
        Container(
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
              // setState(() {
              //   widget.selectedValueController.text = selectedValue!;
              // });
            },
            items: listProducts.map((product) {
                return DropdownMenuItem<String>(child: Text(product.name));
              }).toList(),
          ),
        ),
        // DropDownInput(
        //   dropdownList: listProducts,
        //   labelDropdown: 'Produto',
        //   iconDropdown: Icons.description_rounded,
        //   selectedValueController: productController.state,
        // ),
        TextFieldApp(
          labelItem: 'Código do produto',
          typeController: codeController.state,
          isObscured: false,
          isEnabled: product == null,
        ),
        TextFieldApp(
          labelItem: 'Preço do produto',
          typeController: priceController.state,
          isObscured: false,
          isEnabled: product == null,
        ),
        TextFieldApp(
          labelItem: 'Desconto (%)',
          typeController: discountController.state,
          isObscured: false,
          onChanged: (text) {
            discount = double.parse(text);
            refreshTotal(quantity, discount);
          },
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: quantityController.state,
          isObscured: false,
          onChanged: (text) {
            quantity = int.parse(text);
            refreshTotal(quantity, discount);
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
