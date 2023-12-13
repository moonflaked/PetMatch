import 'package:petmatch/database.dart';
import 'package:sqflite/sqflite.dart';
class User{
  int? userId;
  String? email;
  String? username;
  String? password;

  User(this.userId,this.email,this.username,this.password,);

  User.fromMap(Map<dynamic,dynamic> map){
    userId = map['user_id'];
    email = map['email'];
    username = map['username'];
    password = map['password'];
  }

  Map<String,dynamic> toMap(){
    return {
      "user_id" : userId,
      "email" : email,
      "username" : username,
      "password" : password
    };
  }

  static var instance = PetMatchDatabase.getInstance();

  //1. insert method
  static Future <int?> insert(User user) async{
    Database? db = await instance;
    return await db?.insert("USER", {"email" : user.email, "username" : user.username, "password" : user.password});
  }

  static Future<int?> insertUser(User user) async
  {
    Database? databaseInstance = await PetMatchDatabase.getInstance();

    int? insertedId = await databaseInstance?.insert(
        "USER",
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );

    return insertedId;
  }

// all rows are returned as a list of maps, where each map is a key-value list of columns
//2. View
  static Future<List<Map<String, dynamic>>?> queryAllRows() async{
    Database? db = await instance;
    return await db?.query("User");
  }

//3. Search
//search for any rows on the argument received
  static Future<List<Map<String, dynamic>>?> queryRow(username) async{
    Database? db = await instance;
    return await db?.query("USER",where: "username LIKE '%$username%'");
  }

//4. update method

  static Future<int?> update(User user) async {
    Database? db = await instance;
    int? id = user.toMap()['user_id'];
    return await db?.update("USER", user.toMap(),where: "user_id = ?", whereArgs: [id]);
  }

//5. delete method

  static Future<int?> delete(int id) async{
    Database? db = await instance;
    return await db?.delete("USER",where: "user_id = ?", whereArgs: [id]);
  }

  //checks if user exists
  static Future<bool?> validateLogin(String username, String password) async{
    Database? db = await instance;
    var valid= await db?.query("USER",where: "username LIKE '%$username%' AND password LIKE '%$password%'");
    if(valid!.isNotEmpty){
      return true;
    }
   else {
      return false;
    }
  }

  // //checks if user exists
  // static Future<List<Map<String, dynamic>>?> validateLogin(String username, String password) async
  // {
  //   Database? databaseInstance = await PetMatchDatabase.getInstance();
  //   return await databaseInstance?.query(
  //       "USER",where: "username LIKE '%$username%' AND password LIKE '%$password%'"
  //   );
  // }

}