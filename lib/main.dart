import 'package:flutter/material.dart';

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
    );
  }
}

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
        backgroundColor: Colors.white,
        leading: Image.asset("assets/images/logo.jpg"),
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
        color: Colors.white,
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
    );
  }
}




