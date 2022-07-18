import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';

class GearDatabase {
  late Database database;

  GearDatabase() {
    init();
  }

  void init() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE IF NOT EXISTS product (id INTEGER PRIMARY KEY, name VACHAR(45) NOT NULL, price DOUBLE NOT NULL, category VACHAR(45) NOT NULL, quantity INT NOT NULL, image BLOB NULL)',
        );
      },
    );
  }

  void insert(
    String name,
    double price,
    String category,
    int quantity,
    Uint8List image,
  ) async {
    await database.rawInsert(
      'INSERT INTO product(name, price, category, quantity, image) VALUES("$name", $price, "$category", $quantity, $image)',
    );
  }

  void update() async {
    await database.rawUpdate(
      'UPDATE Test SET name = ?, value = ? WHERE name = ?',
      ['updated name', '9876', 'some name'],
    );
  }

  void select() async {
    List<Map> list = await database.rawQuery('SELECT * FROM product');
    print(list);
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
