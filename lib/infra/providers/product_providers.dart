import 'package:flutter/cupertino.dart';
import 'package:gear/infra/repository/category_repository.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryNotifier extends StateNotifier<List<CategoryModel>> {
  CategoryNotifier() : super([]) {
    getAllCategories();
  }

  Future<List<CategoryModel>> getAllCategories() async {
    CategoryRepository repository = CategoryRepository();
    state = await repository.get('http://192.168.0.43:81/api/Category');
    return state;
  }

  StateProvider<CategoryModel> getCategoryController(CategoryModel model) {
    return StateProvider<CategoryModel>((ref) => model);
  }

  Future<void> addCategory(CategoryModel category) async {
    CategoryRepository repository = CategoryRepository();
    await repository.post('http://192.168.0.43:81/api/Category', category);
    state = await repository.get('http://192.168.0.43:81/api/Category');
  }
}

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super([]);

  Future<List<ProductModel>> getAllProducts(CategoryModel model) async {
    state = model.products!;
    return state;
  }

  void addProduct(ProductModel product) {
    state = [...state, product];
  }
}

final nameProductControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final priceControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final categoryControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final quantityControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final searchControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());
