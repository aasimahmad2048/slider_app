import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'book.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    } else {
      return _db = await _initDB();
    }
  }

  //create table api
  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'books.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE books (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            price REAL
          )
        ''');
      },
    );
  }

  // insert api
  Future<int> insertBook(Book book) async {
    final db = await database;
    return await db.insert('books', book.toMap());
  }

  // read api
  Future<List<Book>> getBooks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('books');
    return List.generate(maps.length, (i) => Book.fromMap(maps[i]));
  }

  // update api
  Future<int> updateBook(Book book) async {
    final db = await database;
    return await db.update(
      'books',
      book.toMap(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  // delete api
  Future<int> deleteBook(int id) async {
    final db = await database;
    return await db.delete('books', where: 'id = ?', whereArgs: [id]);
  }
}
