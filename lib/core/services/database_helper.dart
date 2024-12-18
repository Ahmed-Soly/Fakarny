import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/note_model.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // Private constructor
  DatabaseHelper._internal();

  // Singleton instance
  factory DatabaseHelper() {
    return _instance;
  }

  // Get the database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create the database schema
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Note (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        pin INTEGER NOT NULL,
        date TEXT NOT NULL,
        color INTEGER NOT NULL
      )
    ''');
  }

  // Insert a new note
  Future<int> insertNote(NoteModel note) async {
    final db = await database;
    return await db.insert(
      'Note',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Fetch all notes
  Future<List<NoteModel>> getAllNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Note');

    return List.generate(maps.length, (i) {
      return NoteModel.fromJson(maps[i]);
    });
  }

  // Update a note
  Future<int> updateNote(NoteModel note) async {
    final db = await database;
    return await db.update(
      'Note',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Delete a note
  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      'Note',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
