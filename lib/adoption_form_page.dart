import 'package:flutter/material.dart';


void main(){
    runApp( const AdoptionForm());
}

class AdoptionForm extends StatefulWidget {
  const AdoptionForm({super.key});

  @override
  State<AdoptionForm> createState() => _AdoptionFormState();
}

class _AdoptionFormState extends State<AdoptionForm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Scaffold(
          resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.blueGrey,
          body: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image.asset( 'assets/images/logo.png', // Replace with your image file path
                        fit: BoxFit.cover,
                        height: 150,
                        width: 200,
                      ),
                    ),
                    // Display the image

                    // Positioned button at the top left
                    Positioned(
                      top: 22.0, // Adjust the top position as needed
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

                Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: const Text("Adoption Application, Contract",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                ),

                //Info section
                Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  margin: const EdgeInsets.only(top: 20,left: 10),
                  child: Column(
                    children: [
                      const Text("Info:",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),

                      //Name
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: const Text("Name: Rocco",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      //Age
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: const Text("Age: 23",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      // Weight
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: const Text("Weight(kg): 5",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),
                    ],
                  ),
                ),

                //required section
                Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  margin: const EdgeInsets.only(top: 20,left: 10),
                  child: Column(
                    children: [
                      const Text("Required:",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),


                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: const Row(
                          children: [
                            Text("Do you own any pets?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

                          ],
                        ),
                      ),


                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: const Row(
                          children: [
                            Column(
                              children: [
                                Text("Do you own or rent your home?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

                              ],
                            )
                          ],
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: const Row(
                          children: [
                            Text("Do you own any pets?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 200,top: 20),
                  width: 150,
                  child:
                  ElevatedButton(onPressed: (){

                  }
                    ,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),child: const Text("Submit",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}

























