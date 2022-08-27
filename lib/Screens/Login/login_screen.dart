// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:web_prototype/Screens/Components/login_state.dart';
import 'package:web_prototype/Screens/Home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = "";
  String pass = "";
  @override
  Widget build(BuildContext context) {
    if (GlobalValues.getLoginStatus() == false) {
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
                        username = value;
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
                        onPressed: () {
                          if (pass == "1234" && username == "admin") {
                            GlobalValues.setLoginStatus(true);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }
                        },
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
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
    } else {
      return Scaffold();
    }
  }
}
