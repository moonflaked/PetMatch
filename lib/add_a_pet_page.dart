import "package:flutter/material.dart";


void main() {
  runApp(AddAPet());
}

enum AnimalLabel {
  dog("Dog"),
  cat("Cat");
  const AnimalLabel(this.petLabel);
  final String petLabel;
}
class AddAPet extends StatelessWidget {
  const AddAPet({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const AddAPetBody()
    );
  }
}


class AddAPetBody extends StatefulWidget {
  const AddAPetBody({super.key});

  @override
  State<AddAPetBody> createState() => _AddAPetBodyState();
}

class _AddAPetBodyState extends State<AddAPetBody> {
  TextEditingController animalController = TextEditingController();
  AnimalLabel? selectedAnimalLabel;
  String selectedAnimal = "";

  @override
  Widget build(BuildContext context) {
    double columnLeftMargin = 20.0;

    return Stack(
      children: [
        ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32
                  ),
                  child: Container(
                      child: Text(
                        "Add A Pet",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      )
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        right: 32
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          image: DecorationImage(
                            image: AssetImage(""),
                          )
                      ),
                    )
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: columnLeftMargin,
                bottom: 20,
              ),
              child: Text(
                "Choose an animal:",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin
              ),
              child: DropdownMenu<AnimalLabel>(
                  width: 350,
                  initialSelection: AnimalLabel.dog,
                  controller: animalController,
                  label: const Text("Animal"),
                  onSelected: (AnimalLabel? animalLabel) {
                    setState(() {
                      selectedAnimalLabel = animalLabel;
                    });
                  },
                  dropdownMenuEntries: AnimalLabel.values.map<DropdownMenuEntry<AnimalLabel>>(
                          (AnimalLabel animalLabel) {
                        return DropdownMenuEntry(
                            value: animalLabel,
                            label: animalLabel.petLabel,
                            enabled: true
                        );
                      }
                  ).toList()
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: columnLeftMargin,
                bottom: 20,
              ),
              child: Text(
                "Type the name of the animal:",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin,
                  right: columnLeftMargin
              ),
              child: TextField(
                style: TextStyle(
                    fontSize: 13
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: columnLeftMargin,
                bottom: 20,
              ),
              child: Text(
                "Type the name of the animal:",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin,
                  right: columnLeftMargin
              ),
              child: TextField(
                style: TextStyle(
                    fontSize: 13
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: columnLeftMargin,
                bottom: 20,
              ),
              child: Text(
                "Type the name of the animal:",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin,
                  right: columnLeftMargin
              ),
              child: TextField(
                style: TextStyle(
                    fontSize: 13
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: columnLeftMargin,
                bottom: 20,
              ),
              child: Text(
                "Type the name of the animal:",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin,
                  right: columnLeftMargin
              ),
              child: TextField(
                style: TextStyle(
                    fontSize: 13
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ),


          ],
        ),
        Positioned(
          left: 10,
          bottom: 5,
          right: 10,
          child: ElevatedButton(
            onPressed: () {

            },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.orangeAccent
                )
              ),
            child: Text(
              "Add a pet",
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ),
        )
      ],
    );
  }
}
