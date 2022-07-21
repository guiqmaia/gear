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
    String path = '${databasesPath}geardatabase.db';
    print(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''CREATE TABLE IF NOT EXISTS product (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              name VACHAR(45) NOT NULL, 
              price DOUBLE NOT NULL, 
              category VACHAR(45) NOT NULL, 
              quantity INT NOT NULL, 
              image BLOB NULL)''');

        await db.execute('''CREATE TABLE IF NOT EXISTS user (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              name VACHAR(70) NOT NULL, 
              cpf VARCHAR(20) NOT NULL,
              birthday VARCHAR(14) NOT NULL, 
              company VACHAR(45) NOT NULL, 
              CNPJ VARCHAR(45) NOT NULL, 
              telephone VARCHAR(45) NULL,
              mobileNumber VACHAR(45) NOT NULL, 
              CEP VACHAR(45) NOT NULL, 
              adress VACHAR(70) NOT NULL,
              email VARCHAR(70) NOT NULL,
              password VARCHAR(40) NOT NULL)''');
      },
    );
  }

  Future<ProductModel> insert(ProductModel productModel) async {
    final db = await instance.database;
    db.insert("product", productModel.toMap());
    return productModel;
  }

  Future<UserModel> insertUser(UserModel user) async {
    final db = await instance.database;
    db.insert("user", user.toMap());
    return user;
  }

  // void update() async {
  //   await _database!.rawUpdate(
  //     'UPDATE Test SET name = ?, value = ? WHERE name = ?',
  //     ['updated name', '9876', 'some name'],
  //   );
  // }

  Future<List<ProductModel>> select(category) async {
    final db = await instance.database;
    List<Map> list = await db
        // ignore: prefer_interpolation_to_compose_strings
        .rawQuery('${'SELECT * FROM product WHERE category = "' + category}"');
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

  Future delete(int code) async {
    final db = await instance.database;
    await db.rawDelete('DELETE FROM product WHERE id = $code');
  }

  Future closeDatabase() async {
    final db = await instance.database;
    db.close();
  }
}
