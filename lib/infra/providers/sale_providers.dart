import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../database/gear_database.dart';
import '../models/category_model.dart';
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

class AddSaleNotifier extends StateNotifier<List<CategoryModel>> {
  AddSaleNotifier() : super([]) {
    refreshCategories();
  }

  List<DropdownMenuItem<String>> dropDownItemsCategories = [];
  CategoryModel? category;

  Future<List<CategoryModel>> refreshCategories() async {
    state = await GearDatabase.instance.selectCategories();
    return state;
    // for (CategoryModel categoryModel in state) {
    //   return dropDownItemsCategories.add(
    //     DropdownMenuItem(
    //       value: categoryModel.id.toString(),
    //       child: Text(categoryModel.name),
    //       onTap: () {
    //         category = categoryModel;
    //         refreshProducts(categoryModel.id!);
    //       },
    //     ),
    //   );
  // }
  }

  List<DropdownMenuItem<String>> dropDownItemsProducts = [];

  Future refreshProducts(int categoryId) async {
    List<ProductModel> products =
        await GearDatabase.instance.selectProductsByCategory(categoryId);

    for (ProductModel productModel in products) {
      return dropDownItemsProducts.add(
        DropdownMenuItem(
          value: productModel.id.toString(),
          child: Text(productModel.name),
          onTap: () {
            getProductById(productModel.id!);
          },
        ),
      );
    }
  }

  ProductModel? product;

  Future getProductById(int id) async {
    product = await GearDatabase.instance.selectProductById(id);
    // productCodeControllerProvider.state = product!.id.toString();
    // priceControllerProvider.state = product!.price.toString();
  }
}
