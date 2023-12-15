import 'package:petmatch/pet_model.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class AdoptedPet{
  int? adoptedPetId;
  int? petId;
  int? userId;

  AdoptedPet(this.adoptedPetId,this.petId,this.userId);

  AdoptedPet.fromMap(Map<dynamic,dynamic> map){
    adoptedPetId = map['adoptedPetId'];
    petId = map['petId'];
    userId = map['userId'];
  }

  Map<dynamic, dynamic> toMap(){
    return{
      "adoptedPetId" : adoptedPetId,
      "petId" : petId,
      "userId" : userId
    };
  }

  static Future<List<Pet>?> retrievePetsList (int? pUserId) async{

    Database? db = await PetMatchDatabase.getInstance();

    List<Map<String, dynamic>>? listOfPetMaps = await db?.rawQuery(
        '''
        SELECT PET.PET_ID, PET.NAME, PET.GENDER, PET.DESCRIPTION, PET.AGE, PET.SPECIES, PET.WEIGHT, PET.PET_IMAGE_LINK, PET.CATEGORY_ID, PET.USER_ID FROM PET 
          INNER JOIN ADOPTED_PET
          ON PET.PET_ID = ADOPTED_PET.PET_ID
          WHERE PET.CATEGORY_ID = $pUserId
        '''
      // "ADOPTED_PET",
      // where: "user_id = ?",
      // whereArgs: [pUserId]
    );

    print("LIST OF PETTS INDAAAAATAAAABAAASSSSSEEEE");
    print(listOfPetMaps);
    if(listOfPetMaps == null) {
      print("NULLLL?????????????????? HOWW");
      return null;
    }
    else {
      List<Pet>? listOfPets = listOfPetMaps?.map((pets) =>
          Pet.fromMap(pets)
      ).toList();

      print("HHHHHHHHuuuuuuuuHHHHHHHHHHHHHH");
      print(listOfPets);
      print("AFterrrrrrrrrrrrrrrrrrrr lsitin gpetss ");
      return listOfPets;
    }
  }

}