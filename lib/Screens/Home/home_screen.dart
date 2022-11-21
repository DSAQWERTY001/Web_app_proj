import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_prototype/Fotter/footer.dart';
import 'package:web_prototype/Navbar/Navbar.dart';
import 'package:web_prototype/Screens/Components/app_bar.dart';
import 'package:web_prototype/Screens/Components/body.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../Landingpage/LandingPage.dart';
import '../../aboutus/AboutUs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final homeKey = GlobalKey();
  // final aboutKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // createAlbum();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 44, 195, 255),
                Color.fromARGB(255, 0, 74, 104)
              ]),
        ),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            MediaQuery.of(context).size.width > 1000 ? VoteAppBar() : Navbar(),
            Padding(
              // key: homeKey,
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: LandingPage(),
            ),
            Padding(
              // key: aboutKey,
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
              child: AboutUs(),
            ),
            MediaQuery.of(context).size.width > 1000 ? Footer() : Container()
          ],
        )),
      ),
      // body: SingleChildScrollView(
      //   child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      //     Navbar(),
      //     Padding(
      //       padding:
      //           const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      //       child: LandingPage(),
      //     ),
      //     Padding(
      //       padding:
      //           const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
      //       child: AboutUs(),
      //     ),
      //     // VoteAppBar(),
      //     // Center(
      //     //   child: FutureBuilder<Album>(
      //     //     future: futureAlbum,
      //     //     builder: (context, snapshot) {
      //     //       if (snapshot.hasData) {
      //     //         return Text(snapshot.data!.title);
      //     //       } else if (snapshot.hasError) {
      //     //         return Text('${snapshot.error}');
      //     //       }

      //     //       // By default, show a loading spinner.
      //     //       return const CircularProgressIndicator();
      //     //     },
      //     //   ),
      //     // ),
      //   ]),
      // ),
    );
  }
}

// Future scrollToItem(GlobalKey key) async {
//   final context = key.currentContext!;
//   await Scrollable.ensureVisible(context);
// }
