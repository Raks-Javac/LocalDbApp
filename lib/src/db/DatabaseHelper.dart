import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final _dbName = "myDatabase.db";
  static final _dbVersion = 1;
  static final dbTable = 'user';
  static final columnId = '_id';
  static final columnName = 'username';
  static final columnEmail = 'email';
  static final columnPassword = 'password';

  // this makes it a singleton class
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initialize();

    return _database;
  }

  _initialize() async {
    Directory directory = await getTemporaryDirectory();
    String path = join(directory.path, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    db.execute(
        "CREATE TABLE $dbTable ($columnId integer primary key,$columnName text,$columnEmail text,$columnPassword text)");
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return db.insert(dbTable, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(dbTable);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db
        .update(dbTable, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(dbTable, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteUsername(String username) async {
    Database db = await instance.database;
    return await db
        .delete(dbTable, where: '$columnName = ?', whereArgs: [username]);
  }
}
