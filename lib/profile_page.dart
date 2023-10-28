import "package:flutter/material.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfilePicture(),
        Container(
          margin: const EdgeInsets.only(
            top: 40,
            left: 20,
          ),
          child: InkWell(
            onTap: () {

            },
            child: Container(
                  child: Text(
                    "Username:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  ),
            )
          ),
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: Container(
              width: 150,
              height: 150,
              child: Image.asset("assets/images/landingImage.png"),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )
              ),
            )
        ),
      ),
    );
  }
}

