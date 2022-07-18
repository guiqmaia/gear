import 'dart:typed_data';

import 'package:gear/infra/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

class GearDatabase {
  late Database database;

  GearDatabase() {
    init();
  }

  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE IF NOT EXISTS product (id INTEGER PRIMARY KEY AUTOINCREMENT, name VACHAR(45) NOT NULL, price DOUBLE NOT NULL, category VACHAR(45) NOT NULL, quantity INT NOT NULL, image BLOB NULL)',
        );
      },
    );
  }

  void insert(ProductModel productModel) async {
    await database.insert("product", productModel.toMap());
  }

  void update() async {
    await database.rawUpdate(
      'UPDATE Test SET name = ?, value = ? WHERE name = ?',
      ['updated name', '9876', 'some name'],
    );
  }

  Future<List<ProductModel>> select() async {
    List<Map> list = await database.rawQuery('SELECT * FROM product');
    List<ProductModel> listProducts = [];

    for (int i = 0; i < list.length; i++) {
      listProducts.add(ProductModel(
          id: list[i]['id'],
          name: list[i]['name'],
          price: list[i]['price'],
          category: list[i]['category'],
          quantity: list[i]['quantity'],
          image: list[i]['image']));
    }
    return listProducts;
  }

  // void delete() async {
  //   await database.rawDelete(
  //     'DELETE FROM Test WHERE name = ?',
  //     ['another name'],
  //   );
  // }

  void closeDatabase() async {
    await database.close();
  }
}
