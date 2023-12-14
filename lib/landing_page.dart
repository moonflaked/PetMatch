
import 'package:flutter/material.dart';
import 'package:petmatch/category_page.dart';
import 'package:petmatch/signup_page.dart';

void main(){
  runApp(const LandingPage());
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
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.blueGrey,
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                  Image.asset("assets/images/landingImage.png",height: 400),
                const SizedBox(height: 60,),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child:const Text("Find your best pet in your location!",style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:const Text("PetMatch: Where Love Begins with a Swipe!",style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20,),

                SizedBox(width: 150,height: 40,child:
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PetMatchPageSelector()));
                },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orangeAccent),
                    elevation: MaterialStateProperty.all(10),

                  ), child: const Text("Get Started",style:TextStyle(
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

      ),
    );
  }
}
