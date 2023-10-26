

import 'dart:async';

import 'package:flutter/material.dart';
import "package:petmatch/signup_page.dart";
void main(){
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const SignUp())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
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
                  ElevatedButton(onPressed: (){

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
                  const SizedBox(height: 30,),
                  SizedBox(width: 150,height: 40,child:
                  ElevatedButton(onPressed: (){

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
        )
    );
  }
}


// class Login extends StatelessWidget {
//   Login({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return
//   }
// }
