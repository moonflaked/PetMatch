import "package:sqflite/sqflite.dart";
import "package:path/path.dart";
class PetMatchDatabase {
  static late Database? _database;

  static Future<Database?> getInstance() async
  {
    if(PetMatchDatabase._database == null)
    {
      _database = await _initializeDB();
    }

    return _database;
  }

  static Future<Database> _initializeDB() async
  {
    String petMatchDatabasePath = await getDatabasesPath();

    return openDatabase(
      join(petMatchDatabasePath, "petmatch.db"),
      version: 1,
      onCreate: (Database pDatabase, int version) async
      {
        await pDatabase.execute('''
              
        ''');
      }
    );
  }
}