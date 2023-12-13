
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class Category {
  int? categoryId;
  String? categoryName;

  Category(this.categoryId, this.categoryName);

  Category.fromMap(Map<String, dynamic> map){
    categoryId = map['category_id'];
    categoryName = map['category_name'];
  }

  Map<String, dynamic> toMap() {
    return {
      "category_id": categoryId,
      "category_name": categoryName
    };
  }

  static Future<List<Category>?> retrieveCategories() async {
    Database? db = await PetMatchDatabase.getInstance();


    List<Map<String, Object?>>? listOfCategoryMaps = await db?.query("Category");

    List<Category>? listOfCategories = listOfCategoryMaps?.map((categoryMap) => Category.fromMap(categoryMap)).toList();

    return listOfCategories;
  }
}