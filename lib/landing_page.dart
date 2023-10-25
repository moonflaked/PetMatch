import 'dart:async';

import 'package:flutter/material.dart';

void main(){
  runApp(LandingPage());
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          color: Colors.blueGrey,
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                  Image.asset("assets/images/landingImage.png",height: 400),
                SizedBox(height: 60,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child:Text("Find your best pet in your location!",style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child:Text("PetMatch: Where Love Begins with a Swipe!",style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 20,),

                SizedBox(width: 150,height: 40,child:
                ElevatedButton(onPressed: (){

                }, child: Text("Get Started",style:TextStyle(
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

      ),
    );
  }
}
