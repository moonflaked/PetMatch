import "package:flutter/material.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Map<String, String> mapOfPets = {
    "Angel" : "Golden Retriever",
    "Bella" : "Labrador Retriever",
    "Daisy" : "Beagle",
  };

  @override
  Widget build(BuildContext context) {
    String usernameFieldTitle = "Username";
    FocusNode usernameFocusNode = FocusNode();

    String emailFieldTitle = "Email";
    FocusNode emailFocusNode = FocusNode();

    ScrollController adoptedPetScrollController = ScrollController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ProfilePicture(),
        Container(
          margin: const EdgeInsets.only(
            left: 10,
            top: 30,
          ),
          width: 350,
          child: SettingsFormField(
            fieldFocusNode: usernameFocusNode,
            textFieldController: usernameController,
            textFieldTitle: usernameFieldTitle,
          )
        ),
        Container(
            margin: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            width: 350,
            child: SettingsFormField(
              fieldFocusNode: emailFocusNode,
              textFieldController: emailController,
              textFieldTitle: emailFieldTitle,
            )
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 20,
          ),

          child: ElevatedButton(
            onPressed: () {

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
          child: ListView.builder(
                scrollDirection: Axis.vertical,
                controller: adoptedPetScrollController,
                shrinkWrap: true,
                itemCount: mapOfPets.length,
                itemBuilder: (BuildContext pContext, int pIndex) {
                  return AdoptedPetCard(
                      petName: mapOfPets.keys.elementAt(pIndex),
                      speciesName: mapOfPets.values.elementAt(pIndex)
                  );
                },
              ),
            )
      ]
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
    return Card(
      color: Colors.orangeAccent,
      child: ListTile(
        leading: const Icon(Icons.pets_sharp),
        title: Text(widget.petName),
        subtitle: Text(widget.speciesName),
      )
    );
  }
}

class SettingsFormField extends StatefulWidget {
  final FocusNode fieldFocusNode;
  final TextEditingController textFieldController;
  final String textFieldTitle;
  const SettingsFormField({super.key,
    required this.fieldFocusNode,
    required this.textFieldController,
    required this.textFieldTitle,
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

