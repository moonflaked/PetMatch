import 'package:petmatch/database.dart';
import 'package:sqflite/sqflite.dart';

class Category{
  int? categoryId;
  String? categoryName;

  Category(this.categoryId,this.categoryName);

  Category.fromMap(Map<dynamic,dynamic> map){
    categoryId = map['category_id'];
    categoryName = map['category_name'];
  }

  Map<dynamic, dynamic> toMap(){
    return{
      "category_id" : categoryId,
      "category_name" : categoryName
    };
  }

  static Future<List<Map<String, dynamic>>?> queryAllRows() async{
    Database? db = await PetMatchDatabase.getInstance();
      return await db?.query("CATEGORY");
  }

}