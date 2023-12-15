import 'package:flutter/material.dart';
import 'package:petmatch/adoption_form_page.dart';

void main(){
  runApp( InfoPage());
}


class InfoPage extends StatefulWidget {
  final int? petId;
  final String? petImageLink;

  final String? name;
  final String? gender;
  final String? description;
  final int? age;
  final double? weight;

  const InfoPage({
    super.key,
    this.petId,
    this.petImageLink,
    this.name,
    this.gender,
    this.description,
    this.age,
    this.weight
  });



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
                  // Expanded(child:
                  widget.petImageLink!.isEmpty?
                      Image.asset("assets/images/no-image.png") :
                  Image.network( widget.petImageLink!, // Replace with your image file path
                    fit: BoxFit.cover,
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                  ),
                  // ),
                  // Positioned button at the top left
                  Positioned(
                    top: 16.0, // Adjust the top position as needed
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

              //Logo
              Container(
                margin: const EdgeInsets.only(left: 270,top: 5),
                width: 100,
                child:Image.asset("assets/images/logo.png"),
              ),

              //Pet Name
              Container(
                margin: const EdgeInsets.only(right: 250),
                // width: 100,
                child: Text(widget.name ?? "PetName" ,style: TextStyle(
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
                    child: Column(
                      children: [
                        Text(widget.gender ?? "Male?",style: TextStyle(
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
                    child: Column(
                      children: [
                        Text( widget.age.toString() ?? "age?",style: TextStyle(
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
                    child: Column(
                      children: [
                        Text( widget.weight.toString() ?? "5",style: TextStyle(
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
                child:  Text(widget.description ?? "Description",
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) =>
                        AdoptionForm(name: widget.name,age: widget.age,weight: widget.weight,petId: widget.petId,)));
                  }
                  ,child: const Text("Adopt",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                    elevation: MaterialStateProperty.all(10),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                      )
                    )
                  )

                  ),
                )

            ],
          ),
        ),
      ),
    );
  }
}



















