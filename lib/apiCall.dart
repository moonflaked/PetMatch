import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const APICall());


class APICall extends StatefulWidget {
  const APICall({super.key});

  @override
  State<APICall> createState() => _APICallState();
}

class _APICallState extends State<APICall> {
  late String animalImageUrl;

  Future<List> futurePet() async {
    http.Response response;
    response = await http.get(Uri.parse("https://api.thecatapi.com/v1/images/search?limit=20&api_key=live_ybBUs2S26sju97kKaTDAtVRnOdBs7ftDbcie6NtcNAWHdBFWj5mC8j17PaWnitFj"));
    // ignore: unnecessary_null_comparison

    List mapResponse = jsonDecode(response.body);
    return mapResponse;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body:Center(
          child: FutureBuilder(
              future: futurePet(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Text(
                      'Loading....',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                      ),
                    );

                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List data = snapshot.data ?? [];

                      if(data.isNotEmpty)
                      {
                        animalImageUrl = data[0]["url"];
                      }
                      return CarouselSlider(
                          options: CarouselOptions(
                              // autoPlayAnimationDuration: const Duration(milliseconds: 99999),
                              autoPlay: false,
                              enlargeCenterPage: true,
                              height: 300,

                              onPageChanged: (index, reason) {
                                animalImageUrl = data[index]["url"];
                              },
                          ),
                          items: data.map(
                                (e) => Container(
                                  child: InkWell(
                                      child: Image.network(e["url"], fit: BoxFit.contain,),
                                      onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Good Choice! Choose It? "),
                                                  content: Image.network(e["url"], fit: BoxFit.contain,),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text("NAH"),
                                                      style: TextButton.styleFrom(
                                                        textStyle: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .labelLarge,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        /*
                                                          Get out of the alert dialog, then pop the current page with the animal's
                                                          url
                                                        */
                                                        Navigator.of(context).pop();
                                                        Navigator.of(context).pop(animalImageUrl);
                                                      },
                                                      child: Text("YESS!!"),
                                                      style: TextButton.styleFrom(
                                                        textStyle: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .labelLarge,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                          );



                                    },
                                    )
                                 ),
                          ).toList());
                    }
                }
              }),
        ),

      ),
    );
  }
}