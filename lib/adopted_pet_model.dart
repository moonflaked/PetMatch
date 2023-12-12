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

}