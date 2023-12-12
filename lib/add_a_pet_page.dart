import "package:flutter/material.dart";
import "package:petmatch/apiCall.dart";


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
  TextEditingController speciesController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  AnimalLabel? selectedAnimalLabel;

  late String animalImageUrl = "";

  void showSnackBar(String? snackBarText)
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(
          seconds: 2
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: Colors.grey.shade600,
        content: Text(
          snackBarText ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        width: 200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      )
    );
  }

  bool isTextEditingControllerEmpty(TextEditingController textEditingController, {String snackBarText = ""})
  {
    bool textEditingControllerIsEmpty = false;
    if(textEditingController.text.length <= 0)
    {
        textEditingControllerIsEmpty = true;
        showSnackBar(snackBarText);
    }
    return textEditingControllerIsEmpty;
  }

  bool isAnimalLabelEmpty(AnimalLabel? animalLabel, {String snackBarText = ""})
  {
    bool selectedAnimalLabelIsEmpty = false;
    if(animalLabel == null)
    {
      selectedAnimalLabelIsEmpty = true;
      showSnackBar(snackBarText);
    }
    return selectedAnimalLabelIsEmpty;
  }
  @override
  Widget build(BuildContext context) {
    const double columnLeftMargin = 20.0;
    const double columnRightMargin = 24.0;
    const double textLabelBottomMargin = 15.0;
    const double textFieldFontSize = 21.0;
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
                            fit: BoxFit.fitHeight,
                            image: animalImageUrl.isEmpty ? const AssetImage("assets/images/no-image.png") : NetworkImage(animalImageUrl) as ImageProvider
                          )
                      ),
                    )
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            TextLabel(
              labelText: "Choose an animal",
              textFieldRequired: true,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin
              ),
              child: DropdownMenu<AnimalLabel>(
                  width: 350,
                  controller: animalController,
                  label: const Text(
                    "Choose an animal",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  onSelected: (AnimalLabel? animalLabel) {
                    setState(() {
                      selectedAnimalLabel = animalLabel;
                      animalImageUrl = "";
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
            TextLabel(labelText: "Species", textFieldRequired: true,),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin,
                  right: columnRightMargin
              ),
              child: TextField(
                controller: speciesController,
                style: TextStyle(
                    fontSize: textFieldFontSize
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ),
            TextLabel(labelText: "Name", textFieldRequired: true,),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin,
                  right: columnRightMargin
              ),
              child: TextField(
                controller: nameController,
                style: TextStyle(
                    fontSize: textFieldFontSize
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ),
            TextLabel(labelText: "Gender", textFieldRequired: true,),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin,
                  right: columnRightMargin
              ),
              child: TextField(
                controller: genderController,
                style: TextStyle(
                    fontSize: textFieldFontSize
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ),
            TextLabel(labelText: "Age", textFieldRequired: true,),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin,
                  right: columnRightMargin
              ),
              child: TextField(
                controller: ageController,
                style: TextStyle(
                    fontSize: textFieldFontSize
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ),
            TextLabel(labelText: "Weight", textFieldRequired: true,),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin,
                  right: columnRightMargin
              ),
              child: TextField(
                controller: weightController,
                style: TextStyle(
                    fontSize: textFieldFontSize
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ),
            TextLabel(labelText: "Description", textFieldRequired: false),
            Container(
              margin: EdgeInsets.only(
                  left: columnLeftMargin,
                  right: columnRightMargin
              ),
              child: TextField(
                controller: descriptionController,
                maxLines: 10,
                style: TextStyle(
                    fontSize: textFieldFontSize
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ),
            TextLabel(
              labelText: "Choose a picture"
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 60
              ),
              child: ElevatedButton(
                  onPressed: selectedAnimalLabel == null? null : () async {
                    animalImageUrl = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => APICall(selectedAnimalLabel: selectedAnimalLabel!,))
                    );
                    setState(() {});
                  },
                  style: ButtonStyle(
                      backgroundColor: selectedAnimalLabel == null? MaterialStateProperty.all(
                        Colors.grey.shade300
                      ) : MaterialStateProperty.all(
                          Colors.orangeAccent
                      )
                  ),
                  child: Text(
                    selectedAnimalLabel == null? "Choose an animal to access this option" : "Choose a picture...",
                    style: TextStyle(
                      color: selectedAnimalLabel == null? Colors.grey.shade600 : Colors.black,
                    ),
                  )
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
              ScaffoldMessenger.of(context).clearSnackBars();
              bool animalLabelIsEmpty = isAnimalLabelEmpty(selectedAnimalLabel, snackBarText: "Choose an animal");
              isTextEditingControllerEmpty(speciesController, snackBarText: "Species is empty");
              isTextEditingControllerEmpty(nameController, snackBarText: "Name is empty");
              isTextEditingControllerEmpty(genderController, snackBarText: "Gender is empty");
              isTextEditingControllerEmpty(ageController, snackBarText: "Age is empty");
              isTextEditingControllerEmpty(weightController, snackBarText: "Weight is empty");
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

class TextLabel extends StatefulWidget {
  const TextLabel({super.key, required this.labelText, this.textFieldRequired});
  final String labelText;
  final bool? textFieldRequired;
  @override
  State<TextLabel> createState() => _TextLabelState();
}

class _TextLabelState extends State<TextLabel> {
  @override
  Widget build(BuildContext context) {
    double columnLeftMargin = 20.0;
    double textLabelBottomMargin = 15.0;
    return Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: columnLeftMargin,
          bottom: textLabelBottomMargin,
        ),
        child: Text.rich(
          TextSpan(
              style: TextStyle(
                  fontSize: 16
              ),
              text: widget.labelText,
              children: [
                TextSpan(
                    text: widget.textFieldRequired ?? false? " *" : "",
                    style: TextStyle(
                      color: Colors.red,
                    )
                )
              ]
          ),
        )
    );
  }
}



