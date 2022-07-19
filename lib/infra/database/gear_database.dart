import 'package:gear/infra/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

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
    String path = '${databasesPath}gear.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: (
        Database db,
        int version,
      ) async {
        await db.execute(
          '''CREATE TABLE IF NOT EXISTS product (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              name VACHAR(45) NOT NULL, 
              price DOUBLE NOT NULL, 
              category VACHAR(45) NOT NULL, 
              quantity INT NOT NULL, 
              image BLOB NULL)''',
        );
      },
    );
  }

  Future<ProductModel> insert(ProductModel productModel) async {
    final db = await instance.database;
    db.insert("product", productModel.toMap());
    return productModel;
  }

  void update() async {
    await _database!.rawUpdate(
      'UPDATE Test SET name = ?, value = ? WHERE name = ?',
      ['updated name', '9876', 'some name'],
    );
  }

  Future<List<ProductModel>> select() async {
    final db = await instance.database;
    List<Map> list = await db.rawQuery('SELECT * FROM product');
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

  Future closeDatabase() async {
    final db = await instance.database;
    db.close();
  }
}
