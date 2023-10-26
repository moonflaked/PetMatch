import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petmatch/login_page.dart';


void main(){
    runApp(const Splash());
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const Login())
            )
    );
  }

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        body: Container(
          color: Colors.blueGrey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/logo.png"),
                const Text("Getting ready! Be Patient ;)",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    )
                ),
                const CircularProgressIndicator(color: Colors.yellow,strokeAlign: 3,)
              ],

            ),
          )
        ),
      );
  }
}

