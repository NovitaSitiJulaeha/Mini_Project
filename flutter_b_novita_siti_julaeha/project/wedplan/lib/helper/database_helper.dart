// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wedplan/models/checklist_model.dart';
import '../models/guest_model.dart';

class DatabaseHelper {
  static Database? _database;
  static const String databaseName = 'my_database.db';

  static const String table1Name = 'table1';
  static const String table2Name = 'table2';

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, databaseName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $table1Name (
            id INTEGER PRIMARY KEY,
            name TEXT,
            address TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE $table2Name (
            id INTEGER PRIMARY KEY,
            task TEXT,
            notes TEXT,
            isCompleted REAL
          )
        ''');
      },
    );
  }

  // Tabel Guest
  Future<void> insertGuest(GuestModel guestModel) async {
    final Database db = await database;
    await db.insert(table1Name, guestModel.toMap());
  }

  Future<List<GuestModel>> getGuests() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(table1Name);
    return results.map((e) => GuestModel.fromMap(e)).toList();
  }

  Future<GuestModel> getGuestById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      table1Name,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => GuestModel.fromMap(e)).first;
  }

  Future<void> updateGuest(GuestModel guestModel) async {
    final db = await database;
    await db.update(
      table1Name,
      guestModel.toMap(),
      where: 'id = ?',
      whereArgs: [guestModel.id],
    );
  }

  Future<void> deleteGuest(int id) async {
    final db = await database;
    await db.delete(
      table1Name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Tabel Checklist
  Future<void> insertChecklist(ChecklistModel checklistModel) async {
    final Database db = await database;
    await db.insert(table2Name, checklistModel.toMap());
  }

  Future<List<ChecklistModel>> getChecklists() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(table2Name);
    return results.map((e) => ChecklistModel.fromMap(e)).toList();
  }

  Future<ChecklistModel> getChecklistById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      table2Name,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => ChecklistModel.fromMap(e)).first;
  }

  Future<void> updateChecklist(ChecklistModel checklistModel) async {
    final db = await database;
    await db.update(
      table1Name,
      checklistModel.toMap(),
      where: 'id = ?',
      whereArgs: [checklistModel.id],
    );
  }

  Future<void> deleteChecklist(int id) async {
    final db = await database;
    await db.delete(
      table1Name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
