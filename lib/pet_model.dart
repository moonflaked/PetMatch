
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class Pet{
    int? petId;
    String? name;
    String? gender;
    String? description;
    int? age;
    String? species;
    double? weight;
    int? categoryId;
    int? userId;

    static const petTableName = "pet";

    Pet(this.petId,this.name,this.gender,this.description,
    this.age,this.species,this.weight,this.categoryId,this.userId,);

    Pet.fromMap(Map<dynamic,dynamic> map){
       petId = map['petId'];
       name= map['name'];
       gender= map['gender'];
       description= map['description'];
       age= map['age'];
       species= map['species'];
       weight= map['weight'];
       categoryId= map['categoryId'];
       userId= map['userId'];
    }

    Map<String, Object?> toMap(){
      return{
        "pet_id" : petId,
        "name" : name,
        "gender" : gender,
        "description" : description,
        "age" : age,
        "species" : species,
        "weight" : weight,
        "categoryId" : categoryId,
        "userId" : userId
      };
    }

    static Future<int?> insertPet(Pet petToInsert) async
    {
      Database? databaseInstance = await PetMatchDatabase.getInstance();

      int? insertedId = await databaseInstance?.insert(
        petTableName,
        petToInsert.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
      );

      return insertedId;
    }

    static Future<List<Pet>?> retrievePetsFromCategoryId(int categoryId)
    async
    {
      Database? databaseInstance = await PetMatchDatabase.getInstance();

      List<Map<String, Object?>>? listOfPetMaps = await databaseInstance?.query(
        petTableName,
        where: "category_id = ?",
        whereArgs: [categoryId]
      );

      List<Pet>? listOfPets = listOfPetMaps?.map((petMap) =>
        Pet.fromMap(petMap)
      ).toList();

      return listOfPets;
    }
}