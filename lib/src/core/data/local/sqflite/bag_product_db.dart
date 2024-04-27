import 'dart:developer';

import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_test/database/database_service.dart';

// import '../model/todo.dart';
import 'package:e_commerce/lib.dart';

// abstract class ProductDB {
//   Future<void> createTable(Database database);

//   Future<int> create({required String title});

//   Future<ProductModel> fetchAll();

//   Future<ProductModel> fetchById(int id);

//   Future<int> update({required int id, String? title});

//   Future<void> delete(int id);
// }

class BagProductDB {
  final tableName = 'bagProducts';

  String columnProductID = 'productID';
  String columnName = 'name';
  String columnColor = 'color';
  String columnSize = 'size';
  String columnPricePerUnit = 'pricePerUnit';
  String columnCardTotalPrice = 'cardTotalPrice';
  String columnQuantity = 'quantity';
  String columnProductImgUrl = 'productImgUrl';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      $columnProductID TEXT,
      $columnName TEXT,
      $columnColor TEXT,
      $columnSize TEXT,
      $columnPricePerUnit DOUBLE,
      $columnCardTotalPrice DOUBLE,
      $columnQuantity INTEGER,
      $columnProductImgUrl TEXT
    );""");
  }

  Future<int> create({required BagModel product}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (productID,name,color,size,pricePerUnit,cardTotalPrice,quantity,productImgUrl) VALUES (?,?,?,?,?,?,?,?)''',
      [
        product.productID,
        product.name,
        product.color,
        product.size,
        product.pricePerUnit,
        product.cardTotalPrice,
        product.quantity,
        product.productImgUrl
      ],
    );
  }

  Future<List<BagModel>> fetchAll() async {
    final database = await DatabaseService().database;
    final products = await database.query(tableName);
    return products.map((product) => BagModel.fromJson(product)).toList();
  }

  Future<BagModel> fetchById(String id) async {
    final database = await DatabaseService().database;
    final product = await database
        .query("$tableName", where: "productID = ?", whereArgs: [id]);
    return BagModel.fromJson(product.first);
  }

  Future<int> update({
    required String productID,
    required int newQuantity,
    required double cardTotalPrice,
  }) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableName,
      {
        'quantity': newQuantity,
        'cardTotalPrice': cardTotalPrice,
      },
      where: 'productID = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [productID],
    );
  }

  Future<void> delete({required String id}) async {
    final database = await DatabaseService().database;
    await database
        .rawDelete('''DELETE FROM $tableName WHERE productID = ?''', [id]);
  }
}
