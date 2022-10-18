// ignore_for_file: deprecated_member_use
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_prototype/Screens/Home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String route = '/login';
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String user = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "login page".toUpperCase(),
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Color.fromRGBO(33, 150, 243, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      user = value;
                    },
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      labelText: "username",
                      labelStyle: TextStyle(color: Colors.blue),
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      pass = value;
                    },
                    obscureText: true,
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      labelText: "password",
                      labelStyle: TextStyle(color: Colors.blue),
                      icon: Icon(
                        Icons.admin_panel_settings_outlined,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      color: Colors.blue,
                      onPressed: signIn,
                      child: Text(
                        "login".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(HomeScreen.route);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "home".toUpperCase(),
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future signIn() async {
    SnackBar snackBar = SnackBar(
      content: Text(
        "Login...",
        style: TextStyle(fontSize: 36, color: Colors.black),
      ),
      backgroundColor: Colors.pinkAccent,
      duration: Duration(milliseconds: 1800),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    User? currentUser;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user, password: pass)
        .then((values) {
      currentUser = values.user;
    }).catchError((onError) {
      final snackBar = SnackBar(
        content: Text(
          "Error Occured : " + onError.toString(),
          style: TextStyle(fontSize: 36, color: Colors.black),
        ),
        backgroundColor: Colors.pinkAccent,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    if (currentUser != null) {
      await FirebaseFirestore.instance
          .collection("admins")
          .doc(currentUser!.uid)
          .get()
          .then((snap) {
        if (!snap.exists) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          FirebaseAuth.instance.signOut();
          SnackBar snackBar = SnackBar(
            content: Text(
              "you are not admin",
              style: TextStyle(fontSize: 36, color: Colors.black),
            ),
            backgroundColor: Colors.pinkAccent,
            duration: Duration(milliseconds: 1800),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }
}
