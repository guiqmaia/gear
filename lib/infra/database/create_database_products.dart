import 'dart:typed_data';

import 'package:flutter/services.dart';
import '../../core/app_assets.dart';
import 'gear_database.dart';
import '../models/product_model.dart';

class CreateDatabaseProducts {
  ByteData? bytes;
  Uint8List? imgAsset;

  Future<void> pickImageAsset(path) async {
    try {
      bytes = await rootBundle.load(path);
      imgAsset = bytes!.buffer.asUint8List();
    } catch (e) {
      print('Falha em puxar a imagem: $e');
    }
  }

  List<String> namesSodas = ['Coca-cola', 'Fanta', 'Sprite', 'Pepsi'];
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
  List<String> namesEnergyDrink = ['RedBull', 'Monster', 'Baly'];
  List<String> namesWater = ['Água - Sem gás', 'Água - com gás'];

  List<double> priceSodas = [5.6, 4.3, 4.5, 5.8];
  List<double> priceBeers = [11.7, 12.8, 10.5, 9.5];
  List<double> priceWines = [54.3, 56.8, 43.2, 42.0];
  List<double> priceDistilled = [42.9, 98.5, 65.0, 120.5];
  List<double> priceEnergyDrink = [18.7, 15.6, 12.0];
  List<double> priceWater = [5.0, 6.5];

  List<String> categoryProducts = [
    'Refrigerante',
    'Cerveja',
    'Vinho',
    'Destilado',
    'Energético',
    'Água'
  ];

  List<int> quantitySodas = [35, 10, 20, 25];
  List<int> quantityBeers = [20, 10, 20, 25];
  List<int> quantityWines = [10, 12, 12, 15];
  List<int> quantityDistilled = [10, 15, 8, 7];
  List<int> quantityEnergyDrink = [30, 25, 25];
  List<int> quantityWater = [150, 70];

  Future<ProductModel> createProductModel(
    String name,
    double price,
    String category,
    int quantity,
    String? imgPath,
  ) async {
    await pickImageAsset(imgPath);

    ProductModel productModelProduct = ProductModel(
      name: name,
      price: price,
      category: category,
      quantity: quantity,
      image: imgAsset!,
    );

    return productModelProduct;
  }

  createSodas() async {
    for (int i = 0; i < namesSodas.length; i++) {
      await GearDatabase.instance.insert(
        await createProductModel(
          namesSodas[i],
          priceSodas[i],
          categoryProducts[0],
          quantitySodas[i],
          listSodas[i],
        ),
      );
    }
  }

  createBeers() async {
    for (int i = 0; i < namesBeers.length; i++) {
      await GearDatabase.instance.insert(
        await createProductModel(
          namesBeers[i],
          priceBeers[i],
          categoryProducts[1],
          quantityBeers[i],
          listBeers[i],
        ),
      );
    }
  }

  createWines() async {
    for (int i = 0; i < namesWines.length; i++) {
      await GearDatabase.instance.insert(
        await createProductModel(
          namesWines[i],
          priceWines[i],
          categoryProducts[2],
          quantityWines[i],
          listWines[i],
        ),
      );
    }
  }

  createDistilled() async {
    for (int i = 0; i < namesDistilled.length; i++) {
      await GearDatabase.instance.insert(
        await createProductModel(
          namesDistilled[i],
          priceDistilled[i],
          categoryProducts[3],
          quantityDistilled[i],
          listDistilled[i],
        ),
      );
    }
  }

  createEnergyDrink() async {
    for (int i = 0; i < namesEnergyDrink.length; i++) {
      await GearDatabase.instance.insert(
        await createProductModel(
          namesEnergyDrink[i],
          priceEnergyDrink[i],
          categoryProducts[4],
          quantityEnergyDrink[i],
          listEnergyDrink[i],
        ),
      );
    }
  }

  createWater() async {
    for (int i = 0; i < namesWater.length; i++) {
      await GearDatabase.instance.insert(
        await createProductModel(
          namesWater[i],
          priceWater[i],
          categoryProducts[5],
          quantityWater[i],
          listWater[i],
        ),
      );
    }
  }
}
