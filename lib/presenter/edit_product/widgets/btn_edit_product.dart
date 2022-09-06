import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../../product/product_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../../../infra/models/category_model.dart';
import '../../../infra/models/product_model.dart';
import '../../../infra/providers/product_providers.dart';
import '../../../infra/repository/product_repository.dart';

class BtnEditProduct extends HookConsumerWidget {
  final ProductModel product;
  final CategoryModel category;

  const BtnEditProduct({
    Key? key,
    required this.product,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newNameController = ref.watch(nameProductControllerProvider.state);
    final newPriceController = ref.watch(priceControllerProvider.state);
    final newQuantityController = ref.watch(quantityControllerProvider.state);
    final newPhotoProduct = ref.watch(photoProductProvider.state);

    Future updateProduct() async {
      if (newNameController.state.text != '') {
        product.name = newNameController.state.text;
        newNameController.state.clear();
      }
      if (newPriceController.state.text != '') {
        product.price = double.parse(newPriceController.state.text);
        newPriceController.state.clear();
      }
      if (newQuantityController.state.text != '') {
        product.quantity = int.parse(newQuantityController.state.text);
        newQuantityController.state.clear();
      }
      if (newPhotoProduct.state.path != '') {
        product.image = base64Encode(newPhotoProduct.state.readAsBytesSync());
        newPhotoProduct.state = File('');
      }
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
          updateProduct();
          ProductRepository repository = ProductRepository();
          repository.put('http://zuplae.vps-kinghost.net:8083:81/api/Product', product);

          Navigator.of(context).pushReplacementNamed(
            ProductPage.route,
            arguments: category,
          );
          Navigator.of(context).pop();
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
