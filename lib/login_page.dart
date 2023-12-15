import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/landing_page.dart';
import 'package:petmatch/session.dart';
import "package:petmatch/signup_page.dart";
import 'package:petmatch/user_model.dart';

import 'database.dart';

void main(){
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login()
    );
  }
}


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // Timer(
  //   //     const Duration(seconds: 3),
  //   //         () =>
  //   //         Navigator.of(context).pushReplacement(MaterialPageRoute(
  //   //             builder: (BuildContext context) => const SignUp()))
  //   // );
  // }


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
    PetMatchDatabase.getInstance();
  }
  final petMatchDatabase = PetMatchDatabase.getInstance();


  @override
  Widget build(BuildContext context) {
    return
      // MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   home:
        Scaffold(
          resizeToAvoidBottomInset: false,

          body: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blueGrey,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Image.asset("assets/images/logo.png", width: 200,),
                  const SizedBox(height: 50),
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
                    // obscureText: true,
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
                  const SizedBox(height: 40),
                  SizedBox(width: 150,height: 40,child:
                    ElevatedButton(onPressed: () async{

                      if(username.text.isNotEmpty &&  password.text.isNotEmpty) {
                        Future<bool?> check = _validate(username.text, password.text);
                        var booleanCheck = await check;

                          if(booleanCheck!) {
                            final data = await User.searchByUsername(username.text);
                            late int id;
                            data?.forEach((row) => id=row['user_id']);
                            Session.setUserId(id);

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    LandingPage(),));
                          }



                          // else{
                          //     print("NAHHH NAHHH NAHHH NAHHHH");
                          // }
                      }

                      else{

                        if(username.text.trim().isEmpty){
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

                      ), child: const Text("Login",
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(width: 150,height: 40,child:
                  ElevatedButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp(),));
                  },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orangeAccent),
                      elevation: MaterialStateProperty.all(10),

                    ), child: const Text("SignUp",style:TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  ),
                  ),

                ],
              ),
            ),
          ),
        // )
    );
  }

   Future<bool?> _validate(String username, String password) async{
    var check = await User.validateLogin(username, password);
    // print(check);
    // print("AFTERRRRRRRRR CHEFCKKKKCKCKCKKCKCK");
      if(check == true){
        showFlash(
          context: context,
          duration: const Duration(seconds: 3),
          builder: (context, controller) {
            return Flash(
                controller: controller,
                child: FlashBar(
                  controller: controller,
                  content: Text("Welcome Back $username, nice to see you again!",
                    style: TextStyle(color: Colors.amberAccent, fontSize: 16),),
                  title: Text("Let's Get Rolling!",),
                  elevation: 0,
                  backgroundColor: Colors.deepPurple,
                  progressIndicatorBackgroundColor: Colors.white,
                  indicatorColor: Colors.red,
                )
            );
          },
        );
        return true;
      }
      else{
        showFlash(
          context: context,
          duration: const Duration(seconds: 3),
          builder: (context, controller) {
            return Flash(
                controller: controller,
                child: FlashBar(
                  controller: controller,
                  content: Text("Check if you if misspelled something!",
                    style: TextStyle(color: Colors.amberAccent, fontSize: 16),),
                  title: Text("Looks like you made a mistake ;/",),
                  elevation: 0,
                  backgroundColor: Colors.deepPurple,
                  progressIndicatorBackgroundColor: Colors.white,
                  indicatorColor: Colors.red,
                )
            );
          },
        );
        return false;
    }
      return null;
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
}

