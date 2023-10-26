import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CategoryPage(),
      debugShowCheckedModeBanner: false,

    );
  }
}

// Sets up the bottom navigation bar and the top app bar of the category page
class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: Image.asset("assets/images/logo.png"),
        leadingWidth: 80,
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(
              Icons.notifications_sharp,
              color: Colors.black,
            )
          )
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.home_sharp)
            ),
            IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.settings_sharp)
            ),
            IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.person_sharp)
            ),
          ]
        )
      ),
      body: const CategoryBody()
    );
  }
}

// Creates the body of the category page
class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocationSection(),
        CategoryScrollSection(),
        //CategoryButton(categoryName: "hello")
      ]
    );
  }
}

// Creates the location section at the top of the category page
class LocationSection extends StatefulWidget {
  final String currentLocation = "135 Saint-Croix,Montreal,QC";
  const LocationSection({super.key});

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
            children: [
              Container(
                color: Colors.grey[400],
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: const Icon(
                    Icons.location_on_outlined,
                    size: 36,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 6.5,
                        bottom: 4.0,
                      ),
                      child: const Text(
                          "Your location",
                          style: TextStyle(
                            color: Colors.black54
                          )
                      )
                    ),
                    Row(
                        children: [
                          const Icon(Icons.location_on_sharp),
                          Text(
                            widget.currentLocation
                          )
                        ]
                    )
                  ]
                ),
              )
            ]
        )
    );
  }
}

class CategoryScrollSection extends StatefulWidget {
  const CategoryScrollSection({super.key});

  @override
  State<CategoryScrollSection> createState() => _CategoryScrollSectionState();
}

class _CategoryScrollSectionState extends State<CategoryScrollSection> {
  static List<String> listOfCategories = <String>["Dogs", "Cats", "Hamsters", "Hamsters", "Hamsters", "Hamsters", "Hamsters"];
  static List<GlobalKey<_CategoryButtonState>> listOfCategoryBtnKeys = [];
  // This scroll controller is used to control the scrollbar on the category button section
  static ScrollController categoryScrollController = ScrollController();

  static void setButtonsUnpressed() {
    // A function to reset the colors of all buttons to white
    for(GlobalKey<_CategoryButtonState> globKey in listOfCategoryBtnKeys) {
      globKey.currentState?.resetButtonColor();
    }
  }


  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _CategoryButtonState.setFirstButtonPressed();
    });
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 15.0,
              bottom: 10.0,
            ),
            child: const Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                )
            ),
          ),
          SizedBox(
            height: 35,
            child: RawScrollbar(
              controller: categoryScrollController,
              radius: const Radius.circular(2.5),
              thumbColor: Colors.black,
              child: ListView.builder(
                  controller: categoryScrollController,
                  padding: const EdgeInsets.only(
                    bottom: 8.0
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfCategories.length,
                  itemBuilder: (BuildContext pContext, int pIndex) {
                    GlobalKey<_CategoryButtonState> categoryBtnGlobalKey = GlobalKey<_CategoryButtonState>();
                    CategoryButton newCategoryButton = CategoryButton(
                      key: categoryBtnGlobalKey,
                      categoryName: listOfCategories[pIndex]
                    );

                    listOfCategoryBtnKeys.add(categoryBtnGlobalKey);
                    return newCategoryButton;
                  }
              ),
            ),
          ),
        ]
    );
  }
}


class CategoryButton extends StatefulWidget {
  final String categoryName;

  const CategoryButton({super.key, required this.categoryName});
  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  Color? buttonColor = Colors.white;

  static void setFirstButtonPressed() {
    _CategoryScrollSectionState.listOfCategoryBtnKeys[0].currentState?.setButtonPressed();
  }
  void resetButtonColor() {
    buttonColor = Colors.white;
    setState(() {});
  }
  void setButtonPressed() {
    // Change the color of the button to set the button as pressed
    buttonColor = Colors.grey[400];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 4.0
      ),
      height: 30,
      child: OutlinedButton(
        onPressed: () {
          _CategoryScrollSectionState.setButtonsUnpressed();
          setButtonPressed();
        },
        // Add a style to the button because we want to edit the border
        // and its width
        style: ButtonStyle(
          // Set the minimum size of the button
          minimumSize: MaterialStateProperty.all(
              const Size(100, 35)
          ),
          backgroundColor: MaterialStateProperty.all(
              buttonColor
          ),
          // Change the width of the border of the button
          side: MaterialStateProperty.all(
              const BorderSide(
                width: 1,
                color: Colors.black,
              )
          ),
          // Add the rounded border to the button and customize its radius
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              )
          ),
        ),
        child: Text(
            widget.categoryName,
            style: const TextStyle(
                color: Colors.black
            )
        ),
      )
    );
  }
}





