import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flash/flash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/category_page.dart';
import 'package:petmatch/session.dart';
import 'package:petmatch/user_model.dart';


void main(){
    runApp(  AdoptionForm());
}

class AdoptionForm extends StatefulWidget {
  String? name;
  int? age;
  double? weight;

  int? petId;

   AdoptionForm({
    super.key,
    this.name,
    this.age,
    this.weight,
    this.petId
  });

  @override
  State<AdoptionForm> createState() => _AdoptionFormState();
}

enum Answers { yes, no, own, rent }
class _AdoptionFormState extends State<AdoptionForm> {
  Answers? _question1 = Answers.yes;
  Answers? _question2 = Answers.own;
  Answers? _question3 = Answers.yes;


  TextEditingController initials = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false
        ),
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
                          Navigator.pop(context);
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
                    fontSize: 25,
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
                        child:  Text("Name: ${widget.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      //Age
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child:  Text("Age: ${widget.age}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      // Weight
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child:  Text("Weight(kg): ${widget.weight}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                Text("*Required:",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),

                //required section
                Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  margin: const EdgeInsets.only(top: 20,left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child:Text("Signature of Potential Pet Parent (Initials e.g. YA)",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 140,top: 10),
                        width: 100,
                      child: TextField(
                        controller: initials,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(width: 34))),
                        textAlign: TextAlign.center,
                        maxLength: 2,
                      ),
                      ),

                            Text("Does everybody in your household agree with this adoption?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<Answers>(
                                    value: Answers.yes,
                                    groupValue: _question1,
                                    title: Text("yes", style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    onChanged: (Answers? value) {
                                      setState(() {
                                        _question1 = value;
                                      });
                                    },
                                  ),
                                ),


                                Expanded(
                                child: RadioListTile<Answers>(
                                  value: Answers.no,
                                  groupValue: _question1,
                                  title : Text("no", style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  onChanged: (Answers? value) {
                                    setState(() {
                                      _question1 = value;
                                    });
                                  },
                                ),
                              )
                    ],
                  ),


                      SizedBox(
                        child: Text("Do you own or rent your home?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                      ),
                        Row(
                          children: [
                            Expanded(child:
                            RadioListTile<Answers>(
                              value: Answers.own,
                              groupValue: _question2,
                              title: Text("own", style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              dense: false,
                              onChanged: (Answers? value) {
                                setState(() {
                                  _question2 = value;
                                });
                              },
                            ),
                            ),

                            Expanded(child:
                            RadioListTile<Answers>(
                              value: Answers.rent,
                              groupValue: _question2,
                              title: Text("rent", style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),),
                              onChanged: (Answers? value) {
                                setState(() {
                                  _question2 = value;
                                });
                              },
                            ),
                            )

                          ],
                        ),

                      Text("Do you have a yard?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),


                         Row(
                          children: [
                            Expanded(child:
                            RadioListTile<Answers>(
                              value: Answers.yes,
                              groupValue: _question3,
                              dense: false,
                              title: Text("yes", style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              onChanged: (Answers? value) {
                                setState(() {
                                  _question3 = value;
                                });
                              },
                              // tileColor: Colors.orangeAccent,
                            ),
                            ),


                            Expanded(child:
                            RadioListTile<Answers>(
                              value: Answers.no,
                              groupValue: _question3,
                              title: Text("no", style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              onChanged: (Answers? value) {
                                setState(() {
                                  _question3 = value;
                                });
                              },
                            ),
                            ),
                          ],
                        ),



                    ],
                  ),
                ),



                Container(
                  margin: const EdgeInsets.only(left: 200,),
                  width: 150,
                  child:
                  ElevatedButton(onPressed: (){
                    if(initials.text.trim().isNotEmpty && int.tryParse(initials.text.trim()) == null){
                      AwesomeNotifications().createNotification(
                          content:NotificationContent(
                              id: 1,
                              channelKey: "channel_key",
                              title: "CONGRATS!",
                              body: "WHAT AN ADORABLE PET You Choose!"
                          )
                      );

                       Session.setPetId(widget.petId);
                      int petId = widget.petId!;
                      int userId = Session.getUserId();
                      User.insertUserAndPet(userId, petId);
                      print("PPPPEEEEEETTTTTT IIIIIDDDDDDDDDDD$petId ");
                      print("UUUUUUUUSSSSSSSSSEEEEEEEERRRRRRRRR IIIIIDDDDDDDDDDD   $userId ");

                      Navigator.push(context,MaterialPageRoute(builder:
                          (BuildContext context) { return  CategoryStart();},));
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
                                content: Text(
                                  "Come on, your pet is waiting for *YOU*!",
                                  style: TextStyle(
                                      color: Colors.amberAccent, fontSize: 16,fontWeight: FontWeight.bold),),
                                title: Text("Required Field Is Empty!!",style: TextStyle(
                                  color: Colors.black
                                ),),
                                elevation: 0,
                                backgroundColor: Colors.blueGrey,
                                progressIndicatorBackgroundColor: Colors.white,
                                indicatorColor: Colors.red,
                              )
                          );
                        },
                      );
                    }

                  }
                    ,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    child: const Text("Submit",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                ),



              ],
            ),
          ),
        )
    );
  }
}

























