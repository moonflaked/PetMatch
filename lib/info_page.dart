import 'package:flutter/material.dart';

void main(){
  runApp(const InfoPage());
}


class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.blueGrey[300],
          child: Column(
            children: [
              Stack(
                children: [
                  // Display the image
                  Image.asset( 'assets/images/test.jpg', // Replace with your image file path
                    fit: BoxFit.cover,
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                  ),
                  // Positioned button at the top left
                  Positioned(
                    top: 16.0, // Adjust the top position as needed
                    left: 16.0, // Adjust the left position as needed
                    child: IconButton(
                      onPressed: () {
                        // Button click action
                        // print("1 2 test test perfectoo");
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_outlined,
                        shadows: [
                          Shadow(
                            color: Colors.yellow, // Shadow color
                            offset: Offset(3, 3), // Adjust shadow offset as needed
                            blurRadius: 5, // Adjust shadow blur radius as needed
                          ),
                        ],
                      ),

                    ),
                  ),
                ],
              ),

              //Logo
              Container(
                margin: const EdgeInsets.only(left: 270,top: 5),
                width: 100,
                child:Image.asset("assets/images/logo.png"),
              ),

              //Pet Name
              Container(
                margin: const EdgeInsets.only(right: 250),
                width: 100,
                child:const Text("Name",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                ),
              ),

              //pet info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 25 ),
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orangeAccent[100],
                    ),
                    child: const Column(
                      children: [
                        Text("Male",style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),),

                        Text("Gender",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 25 ),
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orangeAccent[100],
                    ),
                    child: const Column(
                      children: [
                        Text("23",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),

                        Text("Age",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),

                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 10 ),
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orangeAccent[100],
                    ),
                    child: const Column(
                      children: [
                        Text("5",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),

                        Text("Weight(kg)",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                ],
              ),


              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                padding: const EdgeInsets.all(15),
                child: const Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                    style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.fade
                    )
                ),
              ),


              SizedBox(
                width: 250,
                child:
              ElevatedButton(onPressed: (){

                  }
                  ,child: const Text("Adopt",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                )

            ],
          ),
        ),
      ),
    );
  }
}



















