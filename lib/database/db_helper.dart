import 'package:sqflite/sqflite.dart' as sql;

class DbHelper {
  static const String tableName = "todoTable";
  static const String databasePath = "todoTable.db";
  static const String title = "title";
  static const String id = "id";
  static const String description = "description";
  static const String isCompleted = "isCompleted";

  // Method to create the table
  static Future<void> createTable(sql.Database database) async {
    // Debugging statement
    await database.execute(
      '''CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, $title TEXT, $description TEXT, $isCompleted BOOLEAN)''',
    );
  }

  // Method to open the database and create the table if necessary
  static Future<sql.Database> db() async {
    return await sql.openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await createTable(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Implement any schema migrations here
        if (oldVersion < newVersion) {
          await db.execute('DROP TABLE IF EXISTS $tableName');
          await createTable(db);
        }
      },
    );
  }

  // Method to retrieve all data from the table
  static Future<List<Map<String, dynamic>>> getAllData() async {
    try {
      final db = await DbHelper.db();
      return db.query(tableName, orderBy: "$id DESC");
    } catch (e) {
      // Debugging statement
      rethrow;
    }
  }


  static Future<int> addData(Map<String, dynamic> data) async {
    final db = await DbHelper.db();
    final id = db.insert(tableName, data);
    return id;
  }

  static Future<int> editData(int id, Map<String, dynamic> data) async {
    final db = await DbHelper.db();
    final result = db.update(tableName, data, where: "id=?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteData(int id) async {
    final db = await DbHelper.db();
    db.delete(tableName, where: "id=?", whereArgs: [id]);
  }


}
