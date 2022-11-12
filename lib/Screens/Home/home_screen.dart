import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_prototype/Screens/Components/app_bar.dart';
import 'package:web_prototype/Screens/Components/body.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class DogService {
  static randomDog() {
    http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'))
        .then((value) {
      print("Response status: ${value.body}");
    });
  }
}

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String title;

  const Album({
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'],
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    DogService.randomDog();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          VoteAppBar(),
          // Spacer(
          //   flex: 1,
          // ),
          // Body(),
          // Spacer(),
          Center(
            child: FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
