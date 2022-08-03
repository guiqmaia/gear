import 'package:sqflite/sqflite.dart';

import '../models/category_model.dart';
import '../models/default_model.dart';
import '../models/product_model.dart';
import '../models/sale_model.dart';
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

    String dbName = "oaksoaks.db";

    String path = '$databasesPath/$dbName';
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await createTableCategory(db);
        await createTableProduct(db, path);
        await createTableUser(db);
        await createTableSale(db, path);
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

  Future<void> createTableSale(Database db, String path) {
    return db.execute('''CREATE TABLE IF NOT EXISTS sale (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            productId INT NOT NULL,
            price DOUBLE NOT NULL,
            quantity INT NOT NULL,
            pay VARCHAR(50) NOT NULL,
            date DATE,
            CONSTRAINT fk_sale_product
              FOREIGN KEY (productiD)
              REFERENCES "$path.product (id)")''');
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

  Future<ProductModel> selectProductById(int id) async {
    final db = await instance.database;
    List<Map<String, dynamic>> list =
        await db.rawQuery('SELECT * FROM product WHERE id = $id');
    ProductModel productModel = ProductModel.fromMap(list[0]);
    return productModel;
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

  Future<List<CategoryModel>> selectCategoriesIdByName(String name) async {
    final db = await instance.database;
    List<Map<String, dynamic>> list =
        await db.rawQuery('SELECT id FROM category WHERE name = "$name"');
    List<CategoryModel> listCategories = [];

    for (int i = 0; i < list.length; i++) {
      listCategories.add(CategoryModel.fromMap(list[i]));
    }
    return listCategories;
  }

  Future<UserModel> selectUser(login, password) async {
    final db = await instance.database;
    List<Map<String, dynamic>> list = await db.rawQuery(
        'SELECT * FROM user WHERE email = "$login" AND password = "$password"');
    UserModel user = UserModel.fromMap(list[0]);
    return user;
  }

  Future selectSale() async {
    final db = await instance.database;
    List<Map<String, dynamic>> list =
        await db.rawQuery('SELECT * FROM sale ORDER by date DESC');
    List<SaleModel> saleList = [];

    for (int i = 0; i < list.length; i++) {
      saleList.add(
        SaleModel.fromMap(list[i]),
      );
    }
    return saleList;
  }

  Future update(table, id, column, change) async {
    final db = await instance.database;

    await db.rawUpdate(
      'UPDATE $table SET $column = $change WHERE id = $id',
    );
  }

  Future delete(table, int id) async {
    final db = await instance.database;
    await db.rawDelete(
      'DELETE FROM product WHERE id = $id',
    );
  }

  Future closeDatabase() async {
    final db = await instance.database;
    db.close();
  }
}
