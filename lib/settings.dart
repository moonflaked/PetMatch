import "package:flutter/material.dart";

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
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 60
                ),
                child: Text(
                  "Theme",
                ),
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
          )

      ]
    );
  }
}
