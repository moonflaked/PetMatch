
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petmatch/landing_page.dart';
import 'package:petmatch/login_page.dart';
import 'package:petmatch/database.dart';
import 'package:petmatch/user_model.dart';
import 'package:flash/flash.dart';

void main(){
  runApp(const SignUp());
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(
    //     const Duration(seconds: 3),
    //         () =>
    //         Navigator.of(context).pushReplacement(MaterialPageRoute(
    //             builder: (BuildContext context) => const LandingPage()))
    // );
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(

          body: Signup()
        )
    );
  }
}


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup>{

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void setState(VoidCallback fn) async{
    // TODO: implement setState
    super.setState(fn);
    await PetMatchDatabase.getInstance();
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }
  final petMatchDatabase = PetMatchDatabase.getInstance();



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.blueGrey,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Image.asset("assets/images/logo.png", width: 200,),

              const SizedBox(height: 40),
              TextField(
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                controller: email,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    label: const Text("Email"),
                    fillColor: Colors.orangeAccent,filled: true
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                controller: username,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    label: const Text("Username"),
                    fillColor: Colors.orangeAccent,filled: true
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    label: const Text("Password"),
                    fillColor: Colors.orangeAccent,filled: true
                ),
              ),
              // SizedBox(height: 40),


               SizedBox(height: 40),
              SizedBox(width: 150,height: 40,child:
              ElevatedButton(onPressed: ()async{
                if(email.text.isNotEmpty && username.text.isNotEmpty &&  password.text.isNotEmpty) {
                  // print("BEFOREEE");

                  Future<bool?> check = _insert(email.text, username.text, password.text);
                  var booleanCheck = await check;

                  if(booleanCheck!) {
                    showFlash(
                      context: context,
                      duration: const Duration(seconds: 3),
                      builder: (context, controller) {
                        return Flash(
                            controller: controller,
                            child: FlashBar(
                              controller: controller,
                              content: Text(
                                "We are excited to see you :) Please Login ;)",
                                style: TextStyle(
                                    color: Colors.amberAccent, fontSize: 16),),
                              title: Text("WELCOME TO PETMATCH!",),
                              elevation: 0,
                              backgroundColor: Colors.deepPurple,
                              progressIndicatorBackgroundColor: Colors.white,
                              indicatorColor: Colors.red,
                            )
                        );
                      },
                    );

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login(),));
                  }
                }

                else{
                  if(email.text.trim().isEmpty) {
                    // print("hello inside ");
                    _dialogBuilderEmail(context);
                  }
                  else if(username.text.trim().isEmpty){
                    _dialogBuilderUsername(context);
                  }
                  else if(password.text.trim().isEmpty){
                    _dialogBuilderPassword(context);
                  }
                }
              },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orangeAccent),
                  elevation: MaterialStateProperty.all(10),

                ), child: const Text("SignUp",style:TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              ),


              const SizedBox(height: 20),


              SizedBox(width: 150,height: 40,child:
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login(),));
              },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orangeAccent),
                  elevation: MaterialStateProperty.all(10),

                ), child: const Text("Login",style:TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              ),
              const SizedBox(height: 110),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _dialogBuilderEmail(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Email field is EMPTY!"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
                style: TextButton.styleFrom(
                  textStyle: Theme
                      .of(context)
                      .textTheme
                      .labelLarge,
                ),
              )
            ],
          );
        }
    );
  }

  Future<void> _dialogBuilderUsername(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Username field is EMPTY!"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
                style: TextButton.styleFrom(
                  textStyle: Theme
                      .of(context)
                      .textTheme
                      .labelLarge,
                ),
              )
            ],
          );
        }
    );
  }

  Future<void> _dialogBuilderPassword(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Password field is EMPTY!"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
                style: TextButton.styleFrom(
                  textStyle: Theme
                      .of(context)
                      .textTheme
                      .labelLarge,
                ),
              )
            ],
          );
        }
    );
  }

  // Future<void> _dialogBuilderPet(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("You didn't choose a PET!! ~(>_<。)＼ "),
  //           actions: <Widget>[
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text("Close"),
  //               style: TextButton.styleFrom(
  //                 textStyle: Theme
  //                     .of(context)
  //                     .textTheme
  //                     .labelLarge,
  //               ),
  //             )
  //           ],
  //         );
  //       }
  //   );
  // }

   Future<bool?> _insert(email, username, password) async{
    // print("inside insert function");
    Map<String,dynamic> row = {
       "email": email,
       "username" : username,
      "password" : password
    };
    User user = User.fromMap(row);
    final id = await User.insert(user);
    if(id == 0) {
      showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (context, controller) {
          return Flash(
              controller: controller,
              child: FlashBar(
                controller: controller,
                content: Text("Check if you entered your information correctly!",
                  style: TextStyle(color: Colors.amberAccent, fontSize: 16),),
                title: Text("Looks Like Something Went Wrong ?!",),
                elevation: 0,
                backgroundColor: Colors.deepPurple,
                progressIndicatorBackgroundColor: Colors.white,
                indicatorColor: Colors.red,
              )
          );
        },
      );
      // print("WRONGGGGGGGGGGGGGGGGGGGGGG");
      return false;
    }
    else {
      print("correctttttttttttt");
      // print("$id");
      return true;
    }
    return null;

  }
}




