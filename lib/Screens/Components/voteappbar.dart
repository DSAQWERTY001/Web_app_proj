import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:web_prototype/Screens/Components/%E0%B8%BAButton.dart';

import '../Home/home_screen.dart';
import 'menu_item.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.fromLTRB(2, 2, 20, 2),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/BlLogo22.png",
            scale: 10,
            filterQuality: FilterQuality.high,
          ),
          Text(
            " KMUTNB VOTING BY BLOCKCHAIN",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Spacer(),
          menuItem(
            title: "home".toUpperCase(),
            press: () {
              Navigator.of(context).pushNamed(HomeScreen.route);
            },
            color: Colors.white,
          ),
          RButton(
              str: "logout".toUpperCase(),
              press: () async {
                SnackBar snackBar = SnackBar(
                  content: Text(
                    "Loging out...",
                    style: TextStyle(fontSize: 36, color: Colors.black),
                  ),
                  backgroundColor: Colors.pinkAccent,
                  duration: Duration(milliseconds: 1300),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                FirebaseAuth.instance.signOut().then((value) {
                  Timer(const Duration(milliseconds: 1400), () {
                    Navigator.pushNamed(context, HomeScreen.route);
                  });
                });
              },
              bColor: Colors.white,
              tColor: Colors.blue),
        ],
      ),
    );
  }
}
