class Session{
  static late int _userId;
  static late int _petId;

  static setUserId(pSetUser){
    _userId = pSetUser;
  }
  static int getUserId(){
     return _userId;
  }

  static setPetId(pSetPet){
    _petId = pSetPet;
  }
  static int getPetId(){
    return _petId;
  }

}