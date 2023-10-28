import 'package:flutter/material.dart';


void main(){
    runApp( const AdoptionForm());
}

class AdoptionForm extends StatefulWidget {
  const AdoptionForm({super.key});

  @override
  State<AdoptionForm> createState() => _AdoptionFormState();
}

enum Answers { yes, no, own, rent }
class _AdoptionFormState extends State<AdoptionForm> {
  Answers? _question1 = Answers.no;
  Answers? _question2 = Answers.own;
  Answers? _question3 = Answers.yes;
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
                            SizedBox(width: 10,),
                            Text("yes", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),),
                            Radio<Answers>(
                              value: Answers.yes,
                              groupValue: _question1,
                              onChanged: (Answers? value) {
                                setState(() {
                                  _question1 = value;
                                });
                              },
                            ),
                            Text("no", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),
                            Radio<Answers>(
                              value: Answers.no,
                              groupValue: _question1,
                              onChanged: (Answers? value) {
                                setState(() {
                                  _question1 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),


                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: const Row(
                          children: [
                                Container(
                                  child: Text("Do you own or rent your home?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                  width: 180,
                                ),
                            SizedBox(width: 10,),
                            Text("own", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),
                            Radio<Answers>(
                              value: Answers.own,
                              groupValue: _question2,
                              onChanged: (Answers? value) {
                                setState(() {
                                  _question2 = value;
                                });
                              },
                            ),
                            Text("rent", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),
                            Radio<Answers>(
                              value: Answers.rent,
                              groupValue: _question2,
                              onChanged: (Answers? value) {
                                setState(() {
                                  _question2 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: const Row(
                          children: [
                            Text("Do you have a yard?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            SizedBox(width: 10,),
                            Text("yes", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),
                            Radio<Answers>(
                              value: Answers.yes,
                              groupValue: _question3,
                              onChanged: (Answers? value) {
                                setState(() {
                                  _question3 = value;
                                });
                              },
                            ),
                            Text("no", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),
                            Radio<Answers>(
                              value: Answers.no,
                              groupValue: _question3,
                              onChanged: (Answers? value) {
                                setState(() {
                                  _question3 = value;
                                });
                              },
                            ),

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

























