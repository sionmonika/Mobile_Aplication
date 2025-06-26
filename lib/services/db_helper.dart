import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../models/student.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Initialize for desktop if needed
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'class_manager.db');

      print('Database will be created at: $path');

      return await openDatabase(
        path,
        version: 1,
        onCreate: _createDatabase,
      );
    } catch (e) {
      print('Error initializing database: $e');
      rethrow;
    }
  }

  Future<void> _createDatabase(Database db, int version) async {
    try {
      await db.execute('''
        CREATE TABLE students(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT NOT NULL,
          phone TEXT NOT NULL,
          className TEXT NOT NULL,
          department TEXT NOT NULL,
          gender TEXT NOT NULL,
          dateRegistered TEXT NOT NULL,
          present INTEGER DEFAULT 0
        )
      ''');
      print('Students table created successfully');
    } catch (e) {
      print('Error creating table: $e');
      rethrow;
    }
  }

  // CRUD Operations with error handling
  Future<int> insertStudent(Student student) async {
    try {
      final db = await database;
      final id = await db.insert('students', student.toMap());
      print('Inserted student with ID: $id');
      return id;
    } catch (e) {
      print('Error inserting student: $e');
      rethrow;
    }
  }

  Future<List<Student>> getAllStudents() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('students');
      print('Fetched ${maps.length} students');
      return List.generate(maps.length, (i) => Student.fromMap(maps[i]));
    } catch (e) {
      print('Error fetching students: $e');
      rethrow;
    }
  }

  Future<int> updateStudent(Student student) async {
    try {
      final db = await database;
      final count = await db.update(
        'students',
        student.toMap(),
        where: 'id = ?',
        whereArgs: [student.id],
      );
      print('Updated $count student(s)');
      return count;
    } catch (e) {
      print('Error updating student: $e');
      rethrow;
    }
  }

  Future<int> deleteStudent(int id) async {
    try {
      final db = await database;
      final count = await db.delete(
        'students',
        where: 'id = ?',
        whereArgs: [id],
      );
      print('Deleted $count student(s)');
      return count;
    } catch (e) {
      print('Error deleting student: $e');
      rethrow;
    }
  }
}
