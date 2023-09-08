import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'your_database.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE room_members (
        roomMemberId INTEGER PRIMARY KEY,
        boloRoomId INTEGER,
        boloUserId INTEGER,
        isRoomAdmin TEXT,
        createdBy TEXT,
        createdOn TEXT,
        createdIP TEXT,
        modifiedBy TEXT,
        modifiedOn TEXT,
        modifiedIP TEXT
      )
    ''');
  }

  Future<int> insertBoloRoomMember(BoloRoomMember member) async {
    final db = await instance.database;
    return await db.insert('room_members', member.toJson());
  }
  Future<List<Map<String, dynamic>>> getAllBoloRoomMembersAsJson() async {
  final db = await instance.database;
  return await db.query('room_members');
}
}