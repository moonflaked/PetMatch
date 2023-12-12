
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

    Map<dynamic,dynamic> toMap(){
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

}