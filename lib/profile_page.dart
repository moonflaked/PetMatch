import "package:flutter/material.dart";
import 'package:petmatch/adopted_pet_model.dart';
import 'package:petmatch/pet_model.dart';
import 'package:petmatch/session.dart';
import 'package:petmatch/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // Map<String, String> mapOfPets = {
  //   "Angel" : "Golden Retriever",
  //   "Bella" : "Labrador Retriever",
  //   "Daisy" : "Beagle",
  // };

  late Future<List<User>?> info;

  Future<List<User>?> getUserInfo() async{
    int id = Session.getUserId();

    final data = await User.retrieveUserInfoById(id);

    return data;
  }


  //getting list of adopted pets
// i put it outside so it could be accessed from other classes (mainly adopted pet class)
   late Future<List<Pet>?> listOfPets;

  Future<List<Pet>?> getAllUserPets() async{
    int id = Session.getUserId();
    print("inside funnnnnnnnnnnnn");
    final data = await AdoptedPet.retrievePetsList(id);
    // print(data);
    print("after printing dDATATATA");
    if(data != null) {
      print("dDATATATA NOT NULULULLULU");
      return data;
    }
    else{
      print("DATA NULLLL BULL ");
      return null;
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    info = getUserInfo();
    listOfPets = getAllUserPets();

    // getAllUserPets();
    print("After initializing allllllllllllllllllllllllll");
    if(listOfPets == null) print("Nulllllll;/");
    else print("NOT NULL LESSGOOOO");
    setState(() { });
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    getAllUserPets();
  }

  void showSnackBar(String? snackBarText)
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(
              seconds: 2
          ),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.grey.shade600,
          content: Text(
            snackBarText ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          width: 200,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {


    String usernameFieldTitle = "Username";
    FocusNode usernameFocusNode = FocusNode();

    String emailFieldTitle = "Email";
    FocusNode emailFocusNode = FocusNode();

    ScrollController adoptedPetScrollController = ScrollController();
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfilePicture(),
            FutureBuilder(
                future: info,
                builder: (context, snapshot) {
                  return Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      top: 30,
                    ),
                    width: 350,
                    child: snapshot.hasData ? SettingsFormField(
                      fieldFocusNode: usernameFocusNode,
                      textFieldController: usernameController,
                      textFieldTitle: usernameFieldTitle,
                      textFieldValue: snapshot.data![0].username ?? "unknown"
                    ) : CircularProgressIndicator()
                  );
                },
            ),

            FutureBuilder(
                future: info,
                builder: (context, snapshot) => Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      top: 10,
                    ),
                    width: 350,
                    child: snapshot.hasData ? SettingsFormField(
                      fieldFocusNode: emailFocusNode,
                      textFieldController: emailController,
                      textFieldTitle: emailFieldTitle,
                      textFieldValue: snapshot.data![0].email ?? "unknown"
                    )  : CircularProgressIndicator()
                ),
            ),

            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 20,
                ),

                child: ElevatedButton(
                    onPressed: () {
                      User.updateUsernameAndEmail(Session.getUserId(), usernameController.text, emailController.text);
                      showSnackBar("Saved changes!");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.orangeAccent
                      ),
                      minimumSize: MaterialStateProperty.all(
                          const Size(150, 40)
                      ),

                    ),
                    child: const Text(
                        "Save Changes",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )
                    )
                )
            ),
            Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  top: 30,
                ),
                width: 350,
                alignment: Alignment.centerLeft,
                child: const Text(
                    "Adopted pets",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                )
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              width: 350,
              height: 181.2,
              alignment: Alignment.centerLeft,
              child: FutureBuilder(
                future: listOfPets,
                builder: (context, snapshot) {
                  print(snapshot.data);
                  print("SNAPSHOOOOOOOOOOOOOOOOOOOOOOOOOOOOT");
                  // print(listOfPets.then((value) => print(value)));
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        controller: adoptedPetScrollController,
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext pContext, int pIndex) {
                          return AdoptedPetCard(
                              petName: snapshot.data![pIndex].name!,
                              speciesName: snapshot.data![pIndex].species!
                          );
                        },
                      );
                    }
                    else{
                      return Center(child: Text("DONT HAVE ANY YET ;/"));
                    }
                  }
                  else{
                    return Center(child: Text("DONT HAVE ANY YET ;/"));
                  }
                },
              )




            )
          ]
      )
    );
  }
}

class AdoptedPetCard extends StatefulWidget {
  final String petName;
  final String speciesName;
  const AdoptedPetCard({super.key, required this.petName, required this.speciesName});

  @override
  State<AdoptedPetCard> createState() => _AdoptedPetCardState();
}

class _AdoptedPetCardState extends State<AdoptedPetCard> {
  @override
  Widget build(BuildContext context) {
    return
      // FutureBuilder(
      //   future: listOfPets,
      //   builder: (context, snapshot) {
      //     if(snapshot.hasData) {
             Card(
                color: Colors.orangeAccent,
                child: ListTile(
                  leading: const Icon(Icons.pets_sharp),
                  title: Text(widget.petName ?? "Name"),
                  subtitle: Text(widget.speciesName ?? "Species"),
                )
            );
        //   }
        //   else{
        //     return Center(
        //       child: Text("Didn't Adopt any pet yet ;/"),
        //     );
        //   }
        // },
    // );

    /////////////

    // return Card(
    //               color: Colors.orangeAccent,
    //               child: ListTile(
    //                 leading: const Icon(Icons.pets_sharp),
    //                 title: Text(widget.petName),
    //                 subtitle: Text(widget.speciesName),
    //               )
    //           );
  }
}

class SettingsFormField extends StatefulWidget {
  final FocusNode fieldFocusNode;
  final TextEditingController textFieldController;
  final String textFieldTitle;
  final String? textFieldValue;
  const SettingsFormField({super.key,
    required this.fieldFocusNode,
    required this.textFieldController,
    required this.textFieldTitle,
    required this.textFieldValue
  });

  @override
  State<SettingsFormField> createState() => _SettingsFormFieldState();
}

class _SettingsFormFieldState extends State<SettingsFormField> {
  bool isFieldEnabled = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.textFieldController.text = widget.textFieldValue ?? "";
    widget.fieldFocusNode.addListener(() {
      // Listen for the event when the username text field lost focus
      // Then disable the text field because it should only be activated through
      // The pencil icon
      if(!widget.fieldFocusNode.hasFocus) {
        isFieldEnabled = false;
        setState(() {
        });

      }
    });
  }


  @override
  void dispose() {
    // Discard the focus node when the form is disposed
    // Because we want to discard the usage of its resources
    widget.fieldFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Row(
        children: [
          Flexible(
              child: Theme(
                data: ThemeData(
                  // Change the color of the disabled text field
                  // To black
                  // Theme defines the visual appearance of text field
                  disabledColor: Colors.black,
                ),
                child: TextFormField(
                  focusNode: widget.fieldFocusNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )
                    ),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.normal
                    ),
                    label: Text(
                        widget.textFieldTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  controller: widget.textFieldController,
                  enabled: isFieldEnabled,
                  validator: (String? value) {
                    // Code for validating the input values
                    return null;
                  },
                ),
              )
          ),
          Center(
              child: IconButton(
                onPressed: () {
                  isFieldEnabled = true;
                  setState(() {
                  });
                  // Focus on the text form field at the end of the next frame
                  // Without this, the focus node focuses on the text form field
                  // Too quickly
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    widget.fieldFocusNode.requestFocus();
                  });
                },
                icon: const Icon(Icons.edit_sharp)
            )
          )
        ]
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: 30,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 70,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/landingImage.png"),
            radius: 69,
            backgroundColor: Colors.orangeAccent,
          )
        )
        ),
    );
  }
}

