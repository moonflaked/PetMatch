import "package:flutter/material.dart";
import "package:petmatch/Themes/theme.dart";
import "package:petmatch/about_page.dart";
import "package:provider/provider.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
bool themeSwitchState = false;
class _SettingsPageState extends State<SettingsPage> {
  // TextEditingController themeController = TextEditingController();
  String? chosenTheme;
  // List<String> listOfThemes = <String>[
  //   "Default",
  //   "Dark"
  // ];




  bool notificationsSwitchState = true;


  // @override
  // void dispose() {
  //   _themeManager.removeListener(themeListener);
  //   super.dispose();
  // }
  //
  // @override
  // void initState() {
  //   _themeManager.addListener(themeListener);
  //   super.initState();
  // }
  //
  // themeListener(){
  //   // if(mounted){
  //     setState(() {
  //
  //     });
  //   // }
  // }

  // String? selectedString;
  @override
  Widget build(BuildContext context) {
    return Scaffold( body:Column(
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
                    Switch(
                      value: themeSwitchState,
                      activeColor: Colors.blueGrey,
                      onChanged: (bool value) {
                        setState(() {
                          ThemeProvider themeProvider = Provider.of<ThemeProvider>(context,listen: false);
                          themeProvider.swapTheme();
                          themeSwitchState = value;
                        });
                      }
                    )
                    // DropdownButton(
                    //     hint: Text("Select theme"),
                    //     value: chosenTheme,
                    //     onChanged: (newTheme) {
                    //       setState(() {
                    //         chosenTheme = newTheme;
                    //       });
                    //     },
                    //     style: TextStyle(
                    //         fontSize: 20,
                    //         color: Colors.black
                    //     ),
                    //     items: listOfThemes.map((themeElement) {
                    //       return DropdownMenuItem(
                    //           value: themeElement,
                    //           child: Text(themeElement)
                    //       );
                    //     }).toList()
                    // )
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
                              MaterialPageRoute(builder: (context) => AboutPage())
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
    )
    );
  }
}
