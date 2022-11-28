// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_prototype/Screens/Components/%E0%B8%BAButton.dart';
import 'package:web_prototype/Screens/Components/menu_item.dart';
import 'package:web_prototype/Screens/Create_Vote/Dashboard_body.dart';
import 'package:web_prototype/Screens/Create_Vote/create_vote.dart';
import 'package:web_prototype/Screens/Home/home_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../Login/login_screen.dart';

class VoteAppBar extends StatefulWidget {
  const VoteAppBar({Key? key}) : super(key: key);

  @override
  State<VoteAppBar> createState() => _VoteAppBarState();
}

class _VoteAppBarState extends State<VoteAppBar> {
  // final homeKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.fromLTRB(2, 2, 20, 2),
      decoration: BoxDecoration(
        color: Colors.white,
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
          ),
          Text(
            " KMUTNB VOTING BY BLOCKCHAIN",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Spacer(),
          // if (FirebaseFirestore.instance
          //         .collection("superadmins")
          //         .doc(FirebaseAuth.instance.currentUser!.uid)
          //         .get() !=
          //     null)
          //   (menuItem(
          //     title: "Admiun",
          //     press: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const regisAdmin()));
          //     },
          //     color: Colors.blue,
          //   )),
          if (FirebaseAuth.instance.currentUser != null)
            (menuItem(
              title: "Creation Vote",
              press: () {
                Navigator.pushNamed(context, '/vote/create');
              },
              color: Colors.blue,
            )),
          menuItem(
            title: "home".toUpperCase(),
            press: () {
              Navigator.of(context).pushNamed(HomeScreen.route);
            },
            color: Colors.blue,
          ),
          menuItem(
            title: "about us".toUpperCase(),
            press: () async {
              Navigator.of(context).pushNamed(HomeScreen.route);
            },
            color: Colors.blue,
          ),
          if (FirebaseAuth.instance.currentUser != null)
            (RButton(
                str: "logout".toUpperCase(),
                press: () async {
                  SnackBar snackBar = SnackBar(
                    content: Text(
                      "Loging out...",
                      style: TextStyle(fontSize: 36, color: Colors.blue),
                    ),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(milliseconds: 1300),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  FirebaseAuth.instance.signOut().then((value) {
                    Timer(const Duration(milliseconds: 1400), () {
                      Navigator.pushNamed(context, HomeScreen.route);
                    });
                  });
                },
                bColor: Colors.blue,
                tColor: Colors.white))
          else
            (RButton(
                str: "login".toUpperCase(),
                press: () {
                  Navigator.of(context).pushNamed(LoginScreen.route);
                },
                bColor: Colors.blue,
                tColor: Colors.white)),
        ],
      ),
    );
  }
}
