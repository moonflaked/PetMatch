
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
    String? petImageLink;
    int? categoryId;
    int? userId;

    static const petTableName = "pet";

    Pet({this.petId,this.name,this.gender,this.description,
    this.age,this.species,this.weight,this.petImageLink,this.categoryId,this.userId});

    Pet.fromMap(Map<dynamic,dynamic> map){
       petId = map['pet_id'];
       name= map['name'];
       gender = map['gender'];
       description = map['description'];
       age = map['age'];
       species = map['species'];
       weight = map['weight'].toDouble();
       petImageLink = map['pet_image_link'];
       categoryId= map['category_id'];
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
        "pet_image_link" : petImageLink,
        "category_id" : categoryId,
        "user_id" : userId
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

    static Future<List<Pet>?> retrieveNonAdoptedPetsFromCategoryId(int? categoryId)
    async
    {
      if(categoryId == null)
      {
        return [];
      }
      Database? databaseInstance = await PetMatchDatabase.getInstance();

      List<Map<String, Object?>>? listOfPetMaps = await databaseInstance?.rawQuery(
        '''
          SELECT PET.PET_ID, PET.NAME, PET.GENDER, PET.DESCRIPTION, PET.AGE, PET.SPECIES, PET.WEIGHT, PET.PET_IMAGE_LINK, PET.CATEGORY_ID, PET.USER_ID FROM PET 
          LEFT JOIN ADOPTED_PET
          ON PET.PET_ID = ADOPTED_PET.PET_ID
          WHERE PET.CATEGORY_ID = $categoryId AND
          ADOPTED_PET.PET_ID IS NULL;
        '''
      );

      // List<Map<String, Object?>>? listOfPetMaps = await databaseInstance?.query(
      //   "pet",
      //   where: "category_id = ?",
      //   whereArgs: [categoryId]
      // );


      List<Pet>? listOfPets = listOfPetMaps?.map((petMap) =>
        Pet.fromMap(petMap)
      ).toList();

      return listOfPets;
    }

    static Future<List<Map<String,dynamic>>?> retrievePetData(pPetId) async{
      Database? db = await PetMatchDatabase.getInstance();
      List<Map<String,dynamic>>? petDetails = await db?.query(
        petTableName,
        where: "pet_id = ?",
        whereArgs: pPetId
      );
      return petDetails;
    }


}