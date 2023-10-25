
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petmatch/landing_page.dart';

void main(){
  runApp(SignUp());
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LandingPage())));
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          resizeToAvoidBottomInset: true,

          body: Container(
            padding: EdgeInsets.all(20),
            color: Colors.blueGrey,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Image.asset("assets/images/logo.png", width: 200,),

                  SizedBox(height: 40),
                  TextField(
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                    controller: email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20),),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        label: Text("Email"),
                        fillColor: Colors.orangeAccent,filled: true
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                    controller: username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20),),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        label: Text("Username"),
                        fillColor: Colors.orangeAccent,filled: true
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                    controller: password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20),),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        label: Text("Password"),
                        fillColor: Colors.orangeAccent,filled: true
                    ),
                  ),
                  SizedBox(height: 40),

                  TextField(
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                    controller: password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20),),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        label: Text("DROP_DOWN"),
                        fillColor: Colors.orangeAccent,filled: true
                    ),
                  ),

                  SizedBox(height: 60),
                  SizedBox(width: 150,height: 40,child:
                  ElevatedButton(onPressed: (){

                  }, child: Text("SignUp",style:TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orangeAccent),
                      elevation: MaterialStateProperty.all(10),

                    ),
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
