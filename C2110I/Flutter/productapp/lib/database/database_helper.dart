import 'package:productapp/models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseHelper {
  //singleton pattern
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String productTable = 'product';
  String colId = 'id';
  String colName = 'name';
  String colCode = 'code';
  String colPrice = 'price';
  String colColor = 'color';

  DatabaseHelper._createInstance();

  static getInstance() {
    //init 1 time only
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'products.db');
    var database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE $productTable (
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colName TEXT,
        $colCode TEXT,
        $colPrice REAL,
        $colColor TEXT
      )
    ''');
  }

  Future<int> insertProduct(Product product) async {
    Database? db = await this.database;
    var result = await db!.insert(productTable, product.toMap());
    return result;
  }

  Future<List<Product>> getProducts() async {
    Database? db = await this.database;
    var result = await db!.query(productTable);
    List<Product> products = [];
    for (var item in result) {
      products.add(Product.fromMap(item));
    }
    return products;
  }

  Future<int> updateProduct(Product product) async {
    Database? db = await this.database;
    var result = await db!.update(
      productTable,
      product.toMap(),
      where: '$colId = ?',
      whereArgs: [product.id],
    );
    return result;
  }

  Future<int> deleteProduct(int id) async {
    Database? db = await this.database;
    var result = await db!.delete(
      productTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future close() async {
    Database? db = await this.database;
    db!.close();
  }
}