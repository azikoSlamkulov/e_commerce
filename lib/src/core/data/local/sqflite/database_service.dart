import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// import 'package:sqflite_test/database/todo_db.dart';
import 'package:e_commerce/lib.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'bag.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initDB() async {
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await BagProductDB().createTable(database);
}
