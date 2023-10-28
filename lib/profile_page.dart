import "package:flutter/material.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController usernameController = TextEditingController();

  bool usernameFieldEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ProfilePicture(),


        SizedBox(
          width: 350,
          child: TextFormField(
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {

                },
                child: const Icon(
                  Icons.edit_sharp,
                )
              ),
              label: const Text(
                  "Username",
                style: TextStyle(
                  color: Colors.black,
                )
              ),
            ),

            enabled: usernameFieldEnabled,
            controller: usernameController,
            validator: (String? value) {
              return null;
            

            },
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
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )
              ),
              child: Image.asset("assets/images/landingImage.png"),
            )
        ),
      ),
    );
  }
}

