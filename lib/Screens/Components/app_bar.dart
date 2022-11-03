// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_prototype/Screens/Components/%E0%B8%BAButton.dart';
import 'package:web_prototype/Screens/Components/menu_item.dart';
import 'package:web_prototype/Screens/Create_Vote/Dashboard_body.dart';
import 'package:web_prototype/Screens/Create_Vote/create_vote.dart';
import 'package:web_prototype/Screens/Home/home_screen.dart';

import '../Login/login_screen.dart';

class VoteAppBar extends StatefulWidget {
  const VoteAppBar({Key? key}) : super(key: key);

  @override
  State<VoteAppBar> createState() => _VoteAppBarState();
}

class _VoteAppBarState extends State<VoteAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
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
          Text(
            "Logo.png",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Spacer(),
          if (FirebaseAuth.instance.currentUser != null)
            (menuItem(
              title: "Creation Vote",
              press: () {
                Navigator.pushNamed(context, '/vote/create');
              },
            )),
          menuItem(
            title: "home".toUpperCase(),
            press: () {
              Navigator.of(context).pushNamed(HomeScreen.route);
            },
          ),
          menuItem(
              title: "about us".toUpperCase(),
              press: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              }),
          if (FirebaseAuth.instance.currentUser != null)
            (RButton(
                str: "logout".toUpperCase(),
                press: () async {
                  SnackBar snackBar = SnackBar(
                    content: Text(
                      "Loging out...",
                      style: TextStyle(fontSize: 36, color: Colors.black),
                    ),
                    backgroundColor: Colors.pinkAccent,
                    duration: Duration(milliseconds: 1300),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  FirebaseAuth.instance.signOut().then((value) {
                    Timer(const Duration(milliseconds: 1400), () {
                      Navigator.pushNamed(context, HomeScreen.route);
                    });
                  });
                },
                bColor: Colors.white,
                tColor: Colors.blue))
          else
            (RButton(
                str: "login".toUpperCase(),
                press: () {
                  Navigator.of(context).pushNamed(LoginScreen.route);
                },
                bColor: Colors.white,
                tColor: Colors.blue)),
        ],
      ),
    );
  }
}
