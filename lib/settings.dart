import "package:flutter/material.dart";
import "package:petmatch/about_page.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // TextEditingController themeController = TextEditingController();
  String? chosenTheme;
  List<String> listOfThemes = <String>[
    "Default",
    "Dark"
  ];
  bool notificationsSwitchState = true;
  // String? selectedString;
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Container(
                  child: Image.asset(
                      "assets/images/logo.png",
                      scale: 3
                  ),
                )
            ),
            Container(
              margin: const EdgeInsets.only(
                  bottom: 20
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        "Theme",
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    DropdownButton(
                        hint: Text("Select theme"),
                        value: chosenTheme,
                        onChanged: (newTheme) {
                          setState(() {
                            chosenTheme = newTheme;
                          });
                        },
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black
                        ),
                        items: listOfThemes.map((themeElement) {
                          return DropdownMenuItem(
                              value: themeElement,
                              child: Text(themeElement)
                          );
                        }).toList()
                    )
                  ]
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    Switch(
                      value: notificationsSwitchState,
                      activeColor: Colors.lightBlueAccent,
                      onChanged: (bool value) {
                        setState(() {
                          notificationsSwitchState = value;
                        });
                      },
                    )
                  ]
              ),
            ),
            Center(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100
                    ),
                    margin: const EdgeInsets.only(
                        bottom: 20
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp())
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.lightBlueAccent
                            ),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                            )
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "About this app",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black
                                  )
                              ),

                              Container(
                                margin: const EdgeInsets.only(
                                    left: 5
                                ),
                                child: Icon(
                                  Icons.info_outline_rounded,
                                  color: Colors.black,
                                ),
                              )
                            ]
                        )
                    )
                )
            )
          ]
      );
  }
}
