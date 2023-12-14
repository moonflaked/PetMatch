import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:petmatch/login_page.dart';
import 'package:provider/provider.dart';

import 'Themes/theme.dart';


void main() async{
    await AwesomeNotifications().initialize(
        null, // the how will the icon look like in the notification
        [
          NotificationChannel(
              channelGroupKey: "channel_group_key",
              channelKey: "channel_key",
              channelName: "PetMatch Notifications",
              channelDescription: "Testing notification channels",
            ledColor: Colors.amberAccent
          )
        ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: "channel_group_key",
            channelGroupName: "Basic Group",
        )
      ]
    );

    Future<void> requestNotificationPermissions() async {
      final PermissionStatus status = await Permission.notification.request();
      if (status.isGranted) {
      } else if (status.isDenied || status.isRestricted || status.isLimited || status.isPermanentlyDenied) {
         AwesomeNotifications().requestPermissionToSendNotifications();
        print("Permission DeniedWHYYYYYYYYYYYYY inside splash screen");
      }

    }
    bool isAllowedToSendNotification = await AwesomeNotifications().isNotificationAllowed();
    if(!isAllowedToSendNotification){
      AwesomeNotifications().requestPermissionToSendNotifications();
      print("ASKING?????????????????");
      requestNotificationPermissions();
    }

    runApp(
        ChangeNotifierProvider(
        child: Splash(),
        create: (BuildContext context) => ThemeProvider(isDarkMode: false),
        )
    );
}


class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context,themeProvider, child){
          return MaterialApp(
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
            theme: themeProvider.getTheme,
            // ThemeData(
            //     useMaterial3: false
            // ),
          );
        }
    ) ;

  }


}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const Login())
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.blueGrey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/logo.png"),
                const Text("Getting ready! Be Patient ;)",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    )
                ),
                const CircularProgressIndicator(color: Colors.yellow,strokeAlign: 3,)
              ],

            ),
          )
        ),
      );
  }
}

