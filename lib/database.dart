import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class PetMatchDatabase {
  static Database? _database;

  static Future<Database?> getInstance() async
  {
    _database ??= await _initializeDB();
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
              CREATE TABLE USER (
                user_id int AUTOINCREMENT,
                email varchar(256) NOT NULL,
                username varchar(32) NOT NULL,
                password varchar(32) NOT NULL,
                CONSTRAINT USER_USER_ID_PK PRIMARY KEY (user_id)
              );
              
              CREATE TABLE CATEGORY (
                category_id int AUTOINCREMENT,
                category_name varchar(16),
                CONSTRAINT CATEGORY_CATEGORY_ID_PK PRIMARY KEY (category_id)
              );
              
              CREATE TABLE PET (
                pet_id int AUTOINCREMENT,
                name varchar(32) NOT NULL,
                gender varchar(8) NOT NULL,
                description varchar(128),
                age int NOT NULL,
                species varchar(32) NOT NULL,
                weight decimal(7,2) NOT NULL,
                pet_image_link varchar(255),
                category_id int,
                user_id int,
                CONSTRAINT PET_PET_ID_PK PRIMARY KEY (pet_id),
                CONSTRAINT PET_CATEGORY_ID_FK FOREIGN KEY (category_id) REFERENCES CATEGORY,
                CONSTRAINT PET_USER_ID_FK FOREIGN KEY (user_id) REFERENCES USER
              );
              
              CREATE TABLE ADOPTED_PET (
                adopted_pet_id int AUTOINCREMENT,
                pet_id int,
                user_id int,
                CONSTRAINT ADOPTED_PET_ADOPTED_PET_ID_PK PRIMARY KEY (adopted_pet_id),
                CONSTRAINT ADOPTED_PET_PET_ID_FK FOREIGN KEY (pet_id) REFERENCES PET,
                CONSTRAINT ADOPTED_PET_USER_ID_FK FOREIGN KEY (user_id) REFERENCES USER
              );
              
              INSERT INTO USER (email,username,password) VALUES ('conan@gmail.com','conan','conan');
              INSERT INTO USER (email,username,password) VALUES ('logan@gmail.com','logan','logan');
              INSERT INTO CATEGORY (category_name) VALUES ('Dog'), ('Cat');
        ''');
      }
    );
  }
}