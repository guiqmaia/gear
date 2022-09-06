import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repository/product_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/product_model.dart';
import '../models/sale_model.dart';
import '../repository/sale_repository.dart';


class SaleNotifier extends StateNotifier<List<SaleModel>> {
  SaleNotifier(UserModel userModel) : super([]) {
    refreshSales(userModel);
  }

  Future<List<SaleModel>> refreshSales(UserModel userModel) async {
    SaleRepository repository = SaleRepository();
    state = await repository.get('http://zuplae.vps-kinghost.net:8083:81/api/Sale/User/${userModel.id}');
    return state;
  }

  Future addSalesContainer(SaleModel saleModel) async {
    SaleRepository repository = SaleRepository();
    await repository.post('http://zuplae.vps-kinghost.net:8083:81/api/Sale', saleModel);
    state = await repository.get('http://zuplae.vps-kinghost.net:8083:81/api/Sale/User/${saleModel.userId}');

    ProductRepository productRepository = ProductRepository();
    ProductModel product = await productRepository.getById('http://zuplae.vps-kinghost.net:8083:81/api/Product', saleModel.productId);
    product.quantity -= saleModel.quantity;
    await productRepository.put('http://zuplae.vps-kinghost.net:8083:81/api/Product', product);
  }
}

final categoryControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final productControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final productCodeControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final priceControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final discountControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final quantityControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final paymentControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final totalControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());
