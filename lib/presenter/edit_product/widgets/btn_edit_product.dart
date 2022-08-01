import 'package:flutter/material.dart';
import '../../product/widgets/body_product_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/models/category_model.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/gear_database.dart';
import '../../product/product_providers.dart';

class BtnEditProduct extends HookConsumerWidget {
  const BtnEditProduct({
    Key? key,
    required this.productCode,
    required this.category,
  }) : super(key: key);

  final int productCode;
  final CategoryModel category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newNameController = ref.watch(nameProductControllerProvider.state);
    final newPriceController = ref.watch(priceControllerProvider.state);
    final newQuantityController = ref.watch(quantityControllerProvider.state);

    Future updateNameProduct() async {
      if (newNameController.state.text != '') {
        await GearDatabase.instance.update(
          'product',
          productCode,
          'name',
          '"${newNameController.state.text}"',
        );
      }
      newNameController.state.clear();
    }

    Future updatePriceProduct() async {
      if (newPriceController.state.text != '') {
        await GearDatabase.instance.update(
          'product',
          productCode,
          'price',
          double.parse(newPriceController.state.text),
        );
      }
      newPriceController.state.clear();
    }

    Future updateQuantityProduct() async {
      if (newQuantityController.state.text != '') {
        await GearDatabase.instance.update(
          'product',
          productCode,
          'quantity',
          int.parse(newQuantityController.state.text),
        );
      }
      newQuantityController.state.clear();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greenNeon,
      ),
      margin: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      child: TextButton(
        onPressed: () {
          updateNameProduct();
          updatePriceProduct();
          updateQuantityProduct();

          Navigator.of(context).pop();
          ref.watch(productNotifier.notifier).getAllProducts(category);
        },
        child: const Text(
          'Editar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
