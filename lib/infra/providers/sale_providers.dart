import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../database/gear_database.dart';
import '../models/product_model.dart';
import '../models/sale_model.dart';

class SaleNotifier extends StateNotifier<List<SaleModel>> {
  SaleNotifier() : super([]) {
    refreshSales();
  }

  List<ProductModel> products = [];

  Future refreshSales() async {
    state = await GearDatabase.instance.selectSale();

    for (SaleModel sale in state) {
      return products.add(
        await GearDatabase.instance.selectProductById(sale.productId),
      );
    }
  }

  Future addSalesContainer(SaleModel saleModel) async {
    state = [...state, saleModel];
  }

  bool verifyDate(SaleModel saleModel) {
    DateTime dateTime = DateTime.now();
    bool first = true;

    if (first == true) {
      first = !first;
      return true;
    }
    if (DateFormat.yMd().format(saleModel.date) !=
        DateFormat.yMd().format(dateTime)) {
      dateTime = saleModel.date;
      return true;
    }
    return false;
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


