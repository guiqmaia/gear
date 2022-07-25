import 'dart:typed_data';

import 'package:flutter/services.dart';

import '../../core/app_assets.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import 'gear_database.dart';

class CreateDatabaseProducts {
  ByteData? bytes;
  Uint8List? imgAsset;

  Future<void> pickImageAsset(path) async {
    try {
      bytes = await rootBundle.load(path);
      imgAsset = bytes!.buffer.asUint8List();
    } catch (e) {
      // ignore: avoid_print
      print('Falha em buscar a imagem: $e');
    }
  }

  List<String> namescategories = [
    'Refrigerante',
    'Cerveja',
    'Vinho',
    'Destilado',
    'Energético',
    'Água',
  ];

  List<String> namesSodas = [
    'Coca-cola',
    'Fanta',
    'Sprite',
    'Pepsi',
  ];
  List<String> namesBeers = [
    'Mary Wells',
    'Dear Paula',
    'Red Sonja',
    'Stannis Pilsner'
  ];
  List<String> namesWines = [
    'Casa Valduga - C. Sauvignon',
    'Casa Perini - Malbec',
    'Cabriz - Rosé',
    'Cabriz - Branco'
  ];
  List<String> namesDistilled = [
    'Bacardi Carta Oro',
    'Absolut Vodka',
    'Beefeater',
    'White Horse'
  ];
  List<String> namesEnergyDrink = [
    'RedBull',
    'Monster',
    'Baly',
  ];
  List<String> namesWater = [
    'Água - Sem gás',
    'Água - com gás',
  ];

  List<double> priceSodas = [5.6, 4.3, 4.5, 5.8];
  List<double> priceBeers = [11.7, 12.8, 10.5, 9.5];
  List<double> priceWines = [54.3, 56.8, 43.2, 42.0];
  List<double> priceDistilled = [42.9, 98.5, 65.0, 120.5];
  List<double> priceEnergyDrink = [18.7, 15.6, 12.0];
  List<double> priceWater = [5.0, 6.5];

  List<int> quantitySodas = [35, 10, 20, 25];
  List<int> quantityBeers = [20, 10, 20, 25];
  List<int> quantityWines = [10, 12, 12, 15];
  List<int> quantityDistilled = [10, 15, 8, 7];
  List<int> quantityEnergyDrink = [30, 25, 25];
  List<int> quantityWater = [150, 70];

  Future<CategoryModel> createCategoryModel(
    String name,
    String? imgPath,
  ) async {
    await pickImageAsset(imgPath);

    CategoryModel categoryModelProduct = CategoryModel(
      name: name,
      image: imgAsset!,
    );

    return categoryModelProduct;
  }

  createCategories() async {
    for (int i = 0; i < namescategories.length; i++) {
      await GearDatabase.instance.insert(
        'Category',
        await createCategoryModel(
          namescategories[i],
          listCategory[i],
        ),
      );
    }
  }

  Future<ProductModel> createProductModel(
    String name,
    double price,
    int categoryId,
    int quantity,
    String? imgPath,
  ) async {
    await pickImageAsset(imgPath);

    ProductModel productModelProduct = ProductModel(
      name: name,
      price: price,
      categoryId: categoryId,
      quantity: quantity,
      image: imgAsset!,
    );

    return productModelProduct;
  }

  createSodas() async {
    for (int i = 0; i < namesSodas.length; i++) {
      await GearDatabase.instance.insert(
        'product',
        await createProductModel(
          namesSodas[i],
          priceSodas[i],
          1,
          quantitySodas[i],
          listSodas[i],
        ),
      );
    }
  }

  createBeers() async {
    for (int i = 0; i < namesBeers.length; i++) {
      await GearDatabase.instance.insert(
        'product',
        await createProductModel(
          namesBeers[i],
          priceBeers[i],
          2,
          quantityBeers[i],
          listBeers[i],
        ),
      );
    }
  }

  createWines() async {
    for (int i = 0; i < namesWines.length; i++) {
      await GearDatabase.instance.insert(
        'product',
        await createProductModel(
          namesWines[i],
          priceWines[i],
          3,
          quantityWines[i],
          listWines[i],
        ),
      );
    }
  }

  createDistilled() async {
    for (int i = 0; i < namesDistilled.length; i++) {
      await GearDatabase.instance.insert(
        'product',
        await createProductModel(
          namesDistilled[i],
          priceDistilled[i],
          4,
          quantityDistilled[i],
          listDistilled[i],
        ),
      );
    }
  }

  createEnergyDrink() async {
    for (int i = 0; i < namesEnergyDrink.length; i++) {
      await GearDatabase.instance.insert(
        'product',
        await createProductModel(
          namesEnergyDrink[i],
          priceEnergyDrink[i],
          5,
          quantityEnergyDrink[i],
          listEnergyDrink[i],
        ),
      );
    }
  }

  createWater() async {
    for (int i = 0; i < namesWater.length; i++) {
      await GearDatabase.instance.insert(
        'product',
        await createProductModel(
          namesWater[i],
          priceWater[i],
          6,
          quantityWater[i],
          listWater[i],
        ),
      );
    }
  }
}
