import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class PetMatchDatabase {
  static Database? _database;

  static Future<Database?> getInstance() async
  {
    _database ??= await _initializeDB();
    //_initializeCategories();
    return _database;
  }

  static Future<void> _initializeCategories() async
  {
    Database? databaseInstance = await _initializeDB();

    await databaseInstance.insert(
      "category",
      {
        "category_name" : "Dog"
      },
      conflictAlgorithm: ConflictAlgorithm.replace
    );

    // await databaseInstance.insert(
    //     "category",
    //     {
    //       "category_name" : "Cat"
    //     },
    //     conflictAlgorithm: ConflictAlgorithm.replace
    // );
    /*
    await databaseInstance?.transaction((txn) async {
      await txn.insert(
        "Category",
          {
            "category_name": "Dog"
          },
          conflictAlgorithm: ConflictAlgorithm.replace
      );
      await txn.insert(
        "Category",
        {
          "category_name" : "Cat"
        },
        conflictAlgorithm: ConflictAlgorithm.replace
      );

      txn.batch().commit();
    });*/

  }
  static Future<Database> _initializeDB() async
  {
    String petMatchDatabasePath = await getDatabasesPath();
    const categoryTable = '''
      CREATE TABLE CATEGORY (
        category_id INTEGER,
        category_name varchar(16) NOT NULL,
        CONSTRAINT CATEGORY_CATEGORY_ID_PK PRIMARY KEY (category_id)
      );
    ''';

    const userTable = '''
      CREATE TABLE USER (
        user_id INTEGER,
        email varchar(256) NOT NULL,
        username varchar(32) UNIQUE NOT NULL,
        password varchar(32) NOT NULL,
        CONSTRAINT USER_USER_ID_PK PRIMARY KEY (user_id)
      );
    ''';

    const petTable = '''
      CREATE TABLE PET (
        pet_id INTEGER,
        name varchar(32) NOT NULL,
        gender varchar(8) NOT NULL,
        description varchar(128),
        age int NOT NULL,
        species varchar(32) NOT NULL,
        weight decimal(7,2) NOT NULL,
        pet_image_link varchar(1024),
        category_id int,
        user_id int,
        CONSTRAINT PET_PET_ID_PK PRIMARY KEY (pet_id),
        CONSTRAINT PET_CATEGORY_ID_FK FOREIGN KEY (category_id) REFERENCES CATEGORY,
        CONSTRAINT PET_USER_ID_FK FOREIGN KEY (user_id) REFERENCES USER
      );
    ''';

    const adoptedPetTable = '''
      CREATE TABLE ADOPTED_PET (
        adopted_pet_id INTEGER,
        pet_id int,
        user_id int,
        CONSTRAINT ADOPTED_PET_ADOPTED_PET_ID_PK PRIMARY KEY (adopted_pet_id),
        CONSTRAINT ADOPTED_PET_PET_ID_FK FOREIGN KEY (pet_id) REFERENCES PET,
        CONSTRAINT ADOPTED_PET_USER_ID_FK FOREIGN KEY (user_id) REFERENCES USER
      );
    ''';

    const conanUser = '''
          INSERT INTO USER (email,username,password) VALUES ('conan@gmail.com','conan','conan');
    ''';

    const loganUser = '''
              INSERT INTO USER (email,username,password) VALUES ('logan@gmail.com','logan','logan');
    ''';

    const categoryDog = '''
              INSERT INTO CATEGORY (category_name) VALUES ('Dog');
    ''';

    const categoryCat = '''
              INSERT INTO CATEGORY (category_name) VALUES ('Cat');
    ''';


    return openDatabase(
      join(petMatchDatabasePath, "petmatch.db"),
      version: 1,
      onCreate: (Database pDatabase, int version) async
      {
        await pDatabase.execute(categoryTable);
        await pDatabase.execute(userTable);
        await pDatabase.execute(petTable);
        await pDatabase.execute(adoptedPetTable);
        await pDatabase.execute(conanUser);
        await pDatabase.execute(loganUser);
        await pDatabase.execute(categoryDog);
        await pDatabase.execute(categoryCat);
      }
    );
  }
}