import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../database/gear_database.dart';
import '../models/product_model.dart';
import '../models/sale_model.dart';

class SaleNotifier extends StateNotifier<List<SaleModel>> {
  SaleNotifier() : super([]) {
    refreshSales();
  }

  Future refreshSales() async {
    state = await GearDatabase.instance.selectSale();
    return state;
  }

  ProductModel? product;

  Future<ProductModel> getProductById(SaleModel sale) async {
    return product =
        await GearDatabase.instance.selectProductById(sale.productId);
  }

  Future addSalesContainer(SaleModel saleModel) async {
    state = [...state, saleModel];
  }
}

final categoryControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final productControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final productCodeControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final priceControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final discountControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final quantityControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final paymentControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final totalControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
