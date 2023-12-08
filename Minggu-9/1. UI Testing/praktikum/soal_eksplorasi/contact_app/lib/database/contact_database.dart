import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/contact_model.dart';

class ContactDatabase {
  static final ContactDatabase instance = ContactDatabase._init();

  ContactDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb('contact_db.db');
    return _database!;
  }

  Future<Database> _initDb(String fileName) async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const textNullableType = 'TEXT';

    await db.execute('''
CREATE TABLE $contactTable (
  ${ContactFields.id} $idType, 
  ${ContactFields.name} $textType, 
  ${ContactFields.phone} $textType, 
  ${ContactFields.photoName} $textNullableType
  )
''');
  }

  Future<ContactModel> createContactDb(ContactModel contactModel) async {
    final db = await instance.database;

    final id = await db.insert(contactTable, contactModel.toJson());
    return contactModel.copy(id: id);
  }

  Future<ContactModel> readContactDb(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      contactTable,
      columns: ContactFields.columns,
      where: '${ContactFields.id} = ?',
      whereArgs: [id],
    );

    return ContactModel.fromJson(maps.first);
  }

  Future<List<ContactModel>> readAllContactsDb() async {
    final db = await instance.database;

    final result = await db.query(contactTable);

    return result.map((json) => ContactModel.fromJson(json)).toList();
  }

  Future<int> updateContactDb(ContactModel contactModel) async {
    final db = await instance.database;

    return db.update(
      contactTable,
      contactModel.toJson(),
      where: '${ContactFields.id} = ?',
      whereArgs: [contactModel.id],
    );
  }

  Future<int> deleteContact(int id) async {
    final db = await instance.database;

    return db.delete(
      contactTable,
      where: '${ContactFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future closeDb() async {
    final db = await instance.database;

    db.close();
  }
}
