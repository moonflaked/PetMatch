import 'package:flutter/material.dart';
import "package:collection/collection.dart";
import 'package:petmatch/pet_model.dart';
import 'package:petmatch/profile_page.dart';
import 'package:petmatch/settings.dart';

import 'add_a_pet_page.dart';
import 'category_model.dart';


void main() {
  runApp(const CategoryStart());
}

class CategoryStart extends StatefulWidget {
  const CategoryStart({super.key});

  @override
  State<CategoryStart> createState() => _CategoryStartState();
}

class _CategoryStartState extends State<CategoryStart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PetMatchPageSelector(),
      theme: ThemeData(
        useMaterial3: false
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Sets up the bottom navigation bar and the top app bar of the category page
class PetMatchPageSelector extends StatefulWidget {
  const PetMatchPageSelector({super.key});

  @override
  State<PetMatchPageSelector> createState() => _PetMatchPageSelectorState();
}

class _PetMatchPageSelectorState extends State<PetMatchPageSelector> {
  PageController petMatchPageViewController = PageController(
      initialPage: _PetMatchPageSelectorState.currentDestinationIndex,
      keepPage: true
  );
  static int currentDestinationIndex = 0;

  void petMatchPageChanged(int pIndex) {
    setState(() {
      _PetMatchPageSelectorState.currentDestinationIndex = pIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            leading: Image.asset("assets/images/logo.png"),
            leadingWidth: 80,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_sharp,
                    color: Colors.black,
                  )
              )
            ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.orangeAccent,
          currentIndex: currentDestinationIndex,
          onTap: (int pIndex) {
            setState(() {
              currentDestinationIndex = pIndex;
              petMatchPageViewController.animateToPage(
                currentDestinationIndex,
                duration: const Duration(
                  milliseconds: 300
                ),
                curve: Curves.ease
              );
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
                size: 20
              ),
              label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_sharp,
                    size: 20),
                label: "Settings"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_sharp,
                    size: 20),
                label: "Profile"
            ),
          ],
        ),
        body: PageView(
          controller: petMatchPageViewController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            CategoryBody(),
            SettingsPage(),
            ProfilePage()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddAPet())
            );
          },
          backgroundColor: Colors.blueGrey,
          child: Icon(
            Icons.add_sharp,
            color: Colors.black
          )
        )
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
        ]);
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
          child: Row(children: [
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
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    padding: const EdgeInsets.only(
                      left: 6.5,
                      bottom: 4.0,
                    ),
                    child: const Text("Your location",
                        style: TextStyle(color: Colors.black54))),
                Row(children: [
                  const Icon(Icons.location_on_sharp),
                  Text(widget.currentLocation)
                ])
              ]),
            )
          ])
    );
  }
}

class CategoryScrollSection extends StatefulWidget {
  const CategoryScrollSection({super.key});

  @override
  State<CategoryScrollSection> createState() => _CategoryScrollSectionState();
}

class _CategoryScrollSectionState extends State<CategoryScrollSection>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController? categoryTabController;
  static List<Category>? listOfCategories = [];
  // This scroll controller is used to control the scrollbar on the category button section
  static ScrollController categoryScrollController = ScrollController();

  static ScrollController speciesScrollController = ScrollController();

  late Future<Map<String, List<Pet>?>> mapOfPets;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initiateCategoryTabController();
    setState(() {
      mapOfPets = getListOfPets();
    });
  }

  void initiateCategoryTabController() async {
    listOfCategories = await Category.retrieveCategories();

    categoryTabController = TabController(
        length: listOfCategories!.length, vsync: this, initialIndex: 0);
    // Add a listener to the tab controller so that it listens for when the user
    // Scrolls from page to page
    // When it listens for an event, it changes the color of the tab
    categoryTabController?.addListener(() {
      setState(() {});

    });
    setState(() {

    });


  }

  Future<Map<String, List<Pet>?>> getListOfPets() async {
    Map<String, List<Pet>?> mapOfPets = {};
    listOfCategories = await Category.retrieveCategories();
    for(Category category in listOfCategories!)
    {
      mapOfPets[category.categoryName!] = await Pet.retrievePetsFromCategoryId(category.categoryId);
    }
    return mapOfPets;
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return listOfCategories!.isEmpty? const Center(
      child: CircularProgressIndicator()
    ) : Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Container(
          margin: const EdgeInsets.only(
            left: 15.0,
            bottom: 2.0,
          ),
          child: const Text("Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),

        DefaultTabController(
            length: listOfCategories!.length,
            initialIndex: 0,
            child: RawScrollbar(
              controller: categoryScrollController,
              thumbColor: Colors.black,
              radius: const Radius.circular(2),
              // This is wrapped around a list view
              // To remove the warning that a ScrollController
              // has no ScrollController attached
              child: TabBar(
                  controller: categoryTabController,
                  isScrollable: true,
                  // adding padding in between the tabs
                  labelPadding: const EdgeInsets.only(
                    left: 8,
                    right: 2,
                  ),
                  // Remove the "splash" when clicking on a tab
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  // Remove the blue underline under the tabs
                  indicator: const BoxDecoration(),
                  tabs: listOfCategories!.mapIndexed((int pIndex, Category pCategory) =>
                      getCategoryTab(
                          pCategory.categoryName!, categoryTabController?.index == pIndex
                      )
                  ).toList()
              ),
            )
        ),

        Expanded(
          child:
            TabBarView(
                controller: categoryTabController,
                children: (listOfCategories!.isNotEmpty)?
                  (listOfCategories!.map((category) =>
                    FutureBuilder(
                        future: mapOfPets,
                        builder: (context, categoryPetsSnapshot) {
                          switch(categoryPetsSnapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const CircularProgressIndicator();
                            default:
                              if(categoryPetsSnapshot.hasData){
                                return Container(
                                    padding: const EdgeInsets.all(10),
                                    child: ListView(
                                        controller: speciesScrollController,
                                        shrinkWrap: true,
                                        children: [
                                          GridView.builder(
                                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 200,
                                                crossAxisSpacing: 20,
                                                mainAxisSpacing: 20,
                                              ),
                                              controller: speciesScrollController,
                                              shrinkWrap: true,
                                              itemCount: categoryPetsSnapshot.data![category.categoryName]!.length,
                                              itemBuilder: (BuildContext pContext,
                                                  int pIndex) {
                                                return SpeciesContainer(
                                                  petId: categoryPetsSnapshot.data![category.categoryName]![pIndex].petId!,
                                                  speciesName: categoryPetsSnapshot
                                                      .data![category.categoryName]![pIndex].name!,
                                                  petImageLink: categoryPetsSnapshot.data![category.categoryName]![pIndex].petImageLink,
                                                );
                                              }
                                          )
                                        ]
                                    )
                                );
                              }
                          }
                          return const Center(child: CircularProgressIndicator());
                        }
                    )
                  ).toList())
                : [
                  const Center(
                    child: CircularProgressIndicator()
                  ),
                  const Center(
                    child: CircularProgressIndicator()
                  )
                ]
            )
        ),
      ]
      )
    );
  }

  /*
    Used to keep the category page "alive" even when switching bottom navigation bar items
  */
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class SpeciesContainer extends StatefulWidget {
  final String speciesName;
  final int petId;
  final String? petImageLink;
  const SpeciesContainer({
    super.key,
    required this.speciesName,
    required this.petId,
    this.petImageLink});

  @override
  State<SpeciesContainer> createState() => _SpeciesContainerState();
}

class _SpeciesContainerState extends State<SpeciesContainer> {
  @override
  Widget build(BuildContext context) {
    // Clip the Container to this border radius
    return InkWell(
        // Indicate the border radius of the InkWell
        borderRadius: BorderRadius.circular(30.5),
        onTap: () {

        },
        // Whole grid container with black border
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.4,
              ),
              borderRadius: BorderRadius.circular(30.5),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 128.5,
                  // Decoration borderRadius is used here for limiting the container so the
                  // black border of the container has space to display
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(29),
                          topRight: Radius.circular(29)
                      ),
                      image: DecorationImage(
                          image: widget.petImageLink!.isEmpty ? AssetImage("assets/images/no-image.png") : NetworkImage(widget.petImageLink!) as ImageProvider
                      )
                  ),
                ),
                // Bottom part of the container
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: const BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(29),
                          bottomRight: Radius.circular(29)
                      )
                  ),
                  child: Center(
                    child: Text(
                        widget.speciesName,
                        textAlign: TextAlign.center,
                    ),
                  )
                )
              ]
          ),
        ),
    );

  }
}

Widget getCategoryTab(String categoryName, bool isSelected) {
  return Tab(
    child: Container(
      width: 95,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.grey[400] : Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),),
      child: Center(
        child: Text(
            categoryName,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 16)),
      ),
    ),
  );
}
