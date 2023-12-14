
import "package:awesome_notifications/awesome_notifications.dart";
import "package:flutter/material.dart";
import "package:permission_handler/permission_handler.dart";
import "package:petmatch/Themes/theme.dart";
import "package:petmatch/about_page.dart";
import "package:provider/provider.dart";
import"package:petmatch/splash_screen.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
bool themeSwitchState = false;

class _SettingsPageState extends State<SettingsPage>{


     isNotificationOn() async{
       late bool notificationsSwitchState;
       await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
        return notificationsSwitchState = isAllowed;
        print(isAllowed ? "Alloweddddddddddddddd" : "Not allowedddddddddddddddd");
      });
      return notificationsSwitchState;
    }

     Future<bool> _notificationsEnabled = AwesomeNotifications().isNotificationAllowed();
     bool isOn = true;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    if(_notificationsEnabled == true){
      isOn = true;
      Icon(Icons.notifications_active);
    }
    else{
      isOn = false;
      Icon(Icons.notifications_off);
    }
    _notificationsEnabled;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notificationsEnabled;
  }


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
                    // write me a code that controls the device's notification settings with a switch


                    FutureBuilder<bool>(
                        future: AwesomeNotifications().isNotificationAllowed(),
                        builder: (context, snapshot){
                          if (snapshot.hasData) {
                            return //button
                              FloatingActionButton(onPressed: ()async{
                                  requestNotificationPermissions();
                                  setState(() {
                                    snapshot.data!;
                                  });
                              },
                                child:  snapshot.data! ?
                                Icon(Icons.notifications_active) : Icon(Icons.notifications_off),
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return const CircularProgressIndicator();
                        }
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

  Future<bool?> requestNotificationPermissions() async {
    final PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      AwesomeNotifications().requestPermissionToSendNotifications();
      await openAppSettings();
      return true;
      print("Permission Granted Inside requestNotificationPermissions()");
    } else if (status.isDenied || status.isRestricted || status.isLimited || status.isPermanentlyDenied) {
      AwesomeNotifications().requestPermissionToSendNotifications();
      await openAppSettings();
      print("Permission DeniedWHYYYYYYYYYYYYY Inside requestNotificationPermissions()");
      return false;
    }
  }



}
