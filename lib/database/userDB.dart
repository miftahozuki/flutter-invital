import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    await initDbFactory();
    _database = await initDB();
    return _database!;
  }

  Future<void> initDbFactory() async {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "UserDB.db");
    await initDbFactory();
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE IF NOT EXISTS User ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "username TEXT,"
          "email TEXT,"
          "instagram TEXT,"
          "alamat TEXT,"
          "phone_number TEXT"
          ")"
        );
      },
    );
  }

  // Create
  Future<int> addUser(Map<String, dynamic> visitorData) async {
    Database db = await database;
    return await db.insert('User', visitorData);
  }

  // Read all visitors
  Future<List<Map<String, dynamic>>> getAllVisitors() async {
    Database db = await database;
    return await db.query('');
  }

  // Read a visitor by ID
  Future<Map<String, dynamic>> getUserById(int? id) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query('User', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : {};
  }

  // Update a visitor
  Future<int> updateVisitor(int id, Map<String, dynamic> visitorData) async {
    Database db = await database;
    return await db.update('Visitor', visitorData, where: 'id = ?', whereArgs: [id]);
  }

  //delete all
  Future<int> deleteAllUser() async {
    Database db = await database;
    return await db.delete('User');
  }

  // Delete a visitor
  Future<int> deleteVisitor(int id) async {
    Database db = await database;
    return await db.delete('Visitor', where: 'id = ?', whereArgs: [id]);
  }

}
