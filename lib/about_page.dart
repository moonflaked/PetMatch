import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.orange[300],
        body: Container(
          child: Column(
            children: [
              Logo(),
              Text("This application allows you to adopt pets.",style: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )
              ),


              Text("Contact Info:",style: GoogleFonts.eduTasBeginner(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )
              ),
              FAQ(),
            ],
          ),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}



class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                print("1 2 test test perfectoo");
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined,
                shadows: [
                  Shadow(
                    color: Colors.red, // Shadow color
                    offset: Offset(3, 3), // Adjust shadow offset as needed
                    blurRadius: 5, // Adjust shadow blur radius as needed
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }
}



class FAQ extends StatelessWidget {
   FAQ({super.key});

  Map<String,String> questAns = {
    "Q1:" : "How Will I Know If I’ve Been Approved to Adopt a Pet?",
    "A1:" : "After submitting an adoption inquiry, the shelter or rescue group with the pet you’re interested in will contact you.",
    "Q2:" : "How Long Will It Take to Hear Back from the Adoption Group?",
    "A2:" : "PetMatch is a community and, like all communities, each individual or organization is a little bit different. Some days you might send in an inquiry and get a response within a few minutes and other groups may take a few days or a week. ",
    "Q3:" : "How Often is PetMatch Updated?",
    "A3:" : "Because each shelter and rescue group is responsible for keeping its adoptable pet listings current, PetMatch is continuously updated.",
    "Q4:" : "Does Contacting the Shelter or Rescue Group Reserve the Pet I’m Interested In?",
    "A4:" : "Submitting an adoption inquiry does not guarantee that the pet you’ve inquired about will still be available. For more information regarding the status of your inquiry, or the pet you’ve applied for, please contact us.",
    "Q5:" : "Does Contacting the Adoption Group Put The Pet on Hold?",
    "A5:" : "Submitting an adoption inquiry does not guarantee the pet you’ve applied for, nor does it place a pet “on hold”.  For more information regarding the status of your application, or the pet you’ve applied for, please contact the shelter or rescue group listing the pet directly. ",
  };

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 500,
        alignment: Alignment.centerLeft,
      child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: questAns.length,
            itemBuilder: (context, index) {
              return FreqAskedQuest(
                  type: questAns.keys.elementAt(index),
                  response: questAns.values.elementAt(index),
              );
            },
          )

    );
  }
}


class FreqAskedQuest extends StatefulWidget {
  final String type;
  final String response;

  const FreqAskedQuest({super.key, required this.type, required this.response});

  @override
  State<FreqAskedQuest> createState() => _FreqAskedQuestState();
}

class _FreqAskedQuestState extends State<FreqAskedQuest> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(widget.type,style: TextStyle(fontSize: 18),),
        title: Text(widget.response,style: TextStyle(fontSize: 17,),),
      ),
    );
  }
}
