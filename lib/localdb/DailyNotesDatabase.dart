import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

import '../models/UsersData.dart';
class DailyNotesDatabase {
  static Database? _db;
  //static const tableEvents = 'Events';
  static const tableUsers = 'Users';


  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('not null db');
      return;
    }

    try {
      String path = '${await getDatabasesPath()}dailynotes.db';
      debugPrint('in database path');
      _db = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);

    } catch (e) {
    }
  }
  static void _onCreate
      (Database db, int version) async {
    /*await db.execute(
      'CREATE TABLE $tableEvents('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'title STRING, date STRING,image STRING,time STRING,email TEXT)',
    );*/
    await db.execute(
        'CREATE TABLE $tableUsers('
            'email STRING PRIMARY KEY,'
            'username STRING,'
            'password STRING,'
            'phone TEXT,'
            'image STRING'
            ')');
  }

  /*static Future<int> insertNote(MyEvent? note) async {
    return await _db!.insert(tableEvents, note!.toMap());
  }*/

  static saveUser(Users? detail) async {
    return await _db!.insert(tableUsers, detail!.toMap());
  }

/*  static Future<Map<String, dynamic>> getUser(String email) async {
    return await _db!.insert('login', detail!.toMap());
  }*/

  static  Future<int> updateUsersDetails(Users userData) async {
    return await _db!.update(tableUsers, userData.toMap(), where: '"email" = ?',
        whereArgs: [userData.email]);
  }
  static  Future<int> updatePassword(String email, Map<String, dynamic> map) async {
    return await _db!.update(tableUsers,map,  where: '"email" = ?',
        whereArgs: [email]);
  }


  static void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      db.execute("ALTER TABLE $tableUsers ADD COLUMN image STRING;");
    }}

  /*static Future<List<Map<String, dynamic>>> getAllNotes() async {
    return await _db!.query(tableEvents);
  }*/
  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    return await _db!.query(tableUsers);
  }

  static Future<List<Map<String, dynamic>>> getUser(String email) async {
    return
      await _db!.query("Users",where:'"email" = ?',whereArgs: [email]);
  }

  static Future<List<Map<String, dynamic>>> getUserPassword(String email) async {
    return
      await _db!.query("Users",columns: ["password"],where:'"email" = ?',whereArgs: [email]);
  }
 /* static Future<List<Map<String, dynamic>>> getNotes(String email) async {
    return
      await _db!.query(tableEvents,where:'"email" = ?',whereArgs: [email]);
  }*/

 static Future<int> deleteUser(String  email) async {
    return await _db!.delete(tableUsers, where: '"email" = ?', whereArgs: [email]);
  }
 /* static Future deleteEvent(int id) async {
    return await _db!.delete(tableEvents, where: '"id" = ?', whereArgs: [id]);
  }*/

  closeDatabase() async {
    await _db!.close();
  }
}