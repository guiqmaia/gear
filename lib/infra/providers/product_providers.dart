import 'dart:io';

import 'package:flutter/cupertino.dart';
import '../models/user_model.dart';
import '../repository/product_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';
import '../repository/category_repository.dart';

class CategoryNotifier extends StateNotifier<List<CategoryModel>> {
  CategoryNotifier(UserModel userModel) : super([]) {
    getAllCategories(userModel);
  }

  Future<List<CategoryModel>> getAllCategories(UserModel userModel) async {
    CategoryRepository repository = CategoryRepository();
    state = await repository.get('http://192.168.0.43:81/api/Category/User/${userModel.id}');
    return state;
  }

  Future<void> getByIdCategory(CategoryModel category) async {
    CategoryRepository repository = CategoryRepository();
    await repository.getById('http://192.168.0.43:81/api/Category', category.id!);
  }

  Future<void> addCategory(CategoryModel category) async {
    CategoryRepository repository = CategoryRepository();
    await repository.post('http://192.168.0.43:81/api/Category', category);
    state = await repository.get('http://192.168.0.43:81/api/Category/User/${category.userId}');
  }
}

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super([]);

  Future<List<ProductModel>> getAllProducts(CategoryModel model) async {
    ProductRepository repository = ProductRepository();
    state = await repository.getProductByCategory(model.id!);
    return state;
  }

  Future<void> addProduct(ProductModel product, CategoryModel model) async {
    ProductRepository repository = ProductRepository();
    await repository.post('http://192.168.0.43:81/api/Product', product);
    state = await repository.getProductByCategory(model.id!);
  }
}

final nameProductControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final priceControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final categoryControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final quantityControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final searchControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

CategoryModel model = CategoryModel(
  name: 'string',
  image: 'string',
  userId: 0,
);

final categoryModelProvider = StateProvider<CategoryModel>((ref) => model);

final photoProductProvider = StateProvider<File>((ref) => File(''));
