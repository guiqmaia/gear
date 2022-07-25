import 'package:gear/infra/models/category_model.dart';
import 'package:gear/core/app_getit.dart';
import 'package:gear/infra/models/default_model.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product_model.dart';
import '../models/user_model.dart';

class GearDatabase {
  static final GearDatabase instance = GearDatabase._init();
  static Database? _database;

  GearDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    var databasesPath = await getDatabasesPath();
    String dbName = "gyjfgxr.db";
    String path = '$databasesPath/$dbName';
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await createTableCategory(db);
        print('object');
        await createTableProduct(db, path);
        await createTableUser(db);
      },
    );
  }

  Future<void> createTableProduct(Database db, String path) =>
      db.execute('''CREATE TABLE IF NOT EXISTS product (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name VACHAR(45) NOT NULL, 
            price DOUBLE NOT NULL, 
            quantity INT NOT NULL, 
            image BLOB NOT NULL,
            categoryId INT UNSIGNED NOT NULL,
            CONSTRAINT fk_product_category
              FOREIGN KEY (categoryId)
              REFERENCES "$path.category (id)")''');

  Future<void> createTableUser(Database db) {
    return db.execute('''CREATE TABLE IF NOT EXISTS user (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name VACHAR(70) NOT NULL, 
            cpf VARCHAR(20) NOT NULL,
            birthday VARCHAR(14) NOT NULL, 
            company VACHAR(45) NOT NULL, 
            cnpj VARCHAR(45) NOT NULL, 
            telephone VARCHAR(45) NULL,
            mobileNumber VACHAR(45) NOT NULL, 
            cep VACHAR(45) NOT NULL, 
            adress VACHAR(70) NOT NULL,
            email VARCHAR(70) NOT NULL,
            password VARCHAR(40) NOT NULL)''');
  }

  Future<void> createTableCategory(Database db) {
    return db.execute('''CREATE TABLE IF NOT EXISTS category (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name VACHAR(50) NOT NULL,
            image BLOB NOT NULL)''');
  }

  Future<DefaultModel> insert(String table, DefaultModel model) async {
    final db = await instance.database;
    db.insert(table, model.toMap());
    return model;
  }

  Future<List<ProductModel>> selectProductsByCategory(int categoryId) async {
    final db = await instance.database;
    List<Map<String, dynamic>> list = await db
        .rawQuery('SELECT * FROM product WHERE categoryId = $categoryId');
    List<ProductModel> listProducts = [];

    for (int i = 0; i < list.length; i++) {
      listProducts.add(
        ProductModel.fromMap(list[i]),
      );
    }
    return listProducts;
  }

  Future<List<CategoryModel>> selectCategories() async {
    final db = await instance.database;
    List<Map<String, dynamic>> list =
        await db.rawQuery('SELECT * FROM category');
    List<CategoryModel> listCategories = [];

    for (int i = 0; i < list.length; i++) {
      listCategories.add(CategoryModel.fromMap(list[i]));
    }

    return listCategories;
  }

  Future<UserModel> selectUser(login, password) async {
    final db = await instance.database;
    List<Map<String, dynamic>> list = await db.rawQuery(
        '${'SELECT * FROM user WHERE email = "' + login + '" AND password = "' + password}"');
    UserModel user = UserModel.fromMap(list[0]);
    return user;
  }

  Future updateProduct(id, column, change) async {
    final db = await instance.database;

    await db.rawUpdate(
      'UPDATE product SET $column = $change WHERE id = $id',
    );
  }

  Future updateUser(column, change) async {
    final db = await instance.database;

    await db.rawUpdate(
        'UPDATE user SET $column = $change WHERE cpf = ${logedUser.cpf}');
  }

  Future delete(table, int id) async {
    final db = await instance.database;
    db.rawDelete(
      'DELETE FROM product WHERE id = $id',
    );
  }

  Future closeDatabase() async {
    final db = await instance.database;
    db.close();
  }
}
