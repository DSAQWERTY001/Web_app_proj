// ignore_for_file: deprecated_member_use
import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:near_api_flutter/near_api_flutter.dart';
import 'package:web_prototype/Screens/Home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Create_Vote/create_vote_body.dart';

class LoginScreen extends StatefulWidget {
  static String route = '/login';
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String user = "";
  String pass = "";
  bool? _passwordShow;
  // Map response = {};
  // String contractId = 'friendbook.nearflutter.testnet';
  // String mutateMethod = 'submitMessage';
  // String viewMethod = 'getAllMessages';
  // late Account connectedAccount;
  // String userAccount = 'neararabic.testnet';
  // final _textUserIdController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _textUserIdController.text = "nearflutter.testnet";
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordShow = true;
  }

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
                  Image.asset(
                    "assets/images/BlLogo22.png",
                    scale: 4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "login kmutnb voting".toUpperCase(),
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
                    onSubmitted: (value) {
                      signIn();
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
                    onSubmitted: (value) {
                      signIn();
                    },
                    obscureText: _passwordShow ?? false,
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
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.fromLTRB(50, 10, 0, 10),
                    activeColor: Colors.blue,
                    value: _passwordShow,
                    onChanged: (e) {
                      setState(() {
                        _passwordShow = e;
                      });
                    },
                    title: Text(
                      "Hide Password",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        backgroundColor: Colors.blue,
                      ),
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
        style: TextStyle(fontSize: 36, color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Dialogs();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user, password: pass)
        .then((values) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }).catchError((onError) {
      final snackBar = SnackBar(
        content: Text(
          "Error Occured : " + onError.toString(),
          style: TextStyle(fontSize: 36, color: Colors.white),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }
}
