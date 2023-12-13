class Session{
  static late int _userId;


   static setUser(pSetUser){
    _userId = pSetUser;
  }
  static int getUser(){
     return _userId;
  }
}