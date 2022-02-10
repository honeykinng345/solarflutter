import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:basic/models/Appliances.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database; // Singleton Database
  String noteTable = 'appliances_table';
  String _id = 'id';
  String _mApplianceName = 'mApplianceName';
  String _mApplianceWattage = 'mApplianceWattage';
  String _mApplianceQuantity = 'mApplianceQuantity';
  String _bettryType = 'bettryType';
  String _InverterType = 'InverterType';
  String _PlatesType = 'PlatesType';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 6, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($_id INTEGER PRIMARY KEY AUTOINCREMENT, $_mApplianceName TEXT, '
        '$_mApplianceWattage TEXT, $_mApplianceQuantity INTEGER, $_bettryType TEXT,$_InverterType TEXT,$_PlatesType TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getAppliancesMapList() async {
    Database db = await this.database;

    var result = await db.rawQuery('SELECT * FROM $noteTable');
    print(result);
    // var result = await db.query(noteTable);
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(Appliances appliances) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, appliances.toMap());
    return result;
  }

/*  // Update Operation: Update a Note object and save it to database
  Future<int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }*/

  // Delete Operation: Delete a Note object from database
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $_id = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int?> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Appliances>> getNoteList() async {
    var noteMapList =
        await getAppliancesMapList(); // Get 'Map List' from database

    List<Appliances> noteList = List<Appliances>.empty(growable: true); // []
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < noteMapList.length; i++) {
      noteList.add(Appliances.MapToObject(noteMapList[i]));
      print(noteList[i].mApplianceName);
    }

    return noteList;
  }
}
