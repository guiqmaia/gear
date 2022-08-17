import 'package:flutter/cupertino.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../database/gear_database.dart';

class CategoryNotifier extends StateNotifier<List<CategoryModel>> {
  CategoryNotifier() : super([]) {
    getAllCategories();
  }

  Future<List<CategoryModel>> getAllCategories() async {
    state = await GearDatabase.instance.selectCategories();
    return state;
  }

  StateProvider<CategoryModel> getCategoryController(CategoryModel model) {
    return StateProvider<CategoryModel>((ref) => model);
  }

  Future<void> addCategory(CategoryModel category) async {
    await GearDatabase.instance.insert("category", category);
    state = await GearDatabase.instance.selectCategories();
  }
}

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super([]);

  Future<List<ProductModel>> getAllProducts(CategoryModel model) async {
    state = await GearDatabase.instance.selectProductsByCategory(model.id!);
    return state;
  }

  Future addProduct(ProductModel product) async {
    state = await GearDatabase.instance.selectProductsByCategory(product.categoryId);
    // state = [...state, product];
  }
}

final nameProductControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final priceControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final categoryControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final quantityControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final searchControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
