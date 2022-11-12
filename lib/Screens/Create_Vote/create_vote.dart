import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_prototype/Screens/Components/app_bar.dart';
import 'package:web_prototype/Screens/Components/voteappbar.dart';
import '../Components/ฺButton.dart';
import '../Home/home_screen.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:web_prototype/Screens/Create_Vote/create_vote_body.dart';

import 'Dashboard_body.dart';

class createVoteScreen extends StatefulWidget {
  static const String route = '/vote/create';
  const createVoteScreen({Key? key}) : super(key: key);

  @override
  State<createVoteScreen> createState() => _createVoteScreenState();
}

class _createVoteScreenState extends State<createVoteScreen> {
  int _page = 0;
  Widget bodyFunction(BuildContext context) {
    switch (_page) {
      case 0:
        return DashboardPage();
        break;
      case 1:
        return CreateBody();
        break;
      default:
        return DashboardPage();
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return Scaffold(
          body: _page == 0
              ? Container(
                  child: Column(
                    children: [
                      MyWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          RButton(
                            str: "Dashboard",
                            press: () {
                              setState(() {
                                _page = 0;
                              });
                            },
                            bColor:
                                _page == 0 ? Colors.blue : Colors.grey.shade200,
                            tColor: _page == 0 ? Colors.white : Colors.blue,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          RButton(
                            str: "Create",
                            press: () {
                              setState(() {
                                _page = 1;
                              });
                            },
                            bColor:
                                _page == 0 ? Colors.grey.shade200 : Colors.blue,
                            tColor: _page == 0 ? Colors.blue : Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(child: bodyFunction(context)),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      MyWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          RButton(
                            str: "Dashboard",
                            press: () {
                              setState(() {
                                _page = 0;
                              });
                            },
                            bColor:
                                _page == 0 ? Colors.blue : Colors.grey.shade200,
                            tColor: _page == 0 ? Colors.white : Colors.blue,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          RButton(
                            str: "Create",
                            press: () {
                              setState(() {
                                _page = 1;
                              });
                            },
                            bColor:
                                _page == 0 ? Colors.grey.shade200 : Colors.blue,
                            tColor: _page == 0 ? Colors.blue : Colors.white,
                          ),
                        ],
                      ),
                      Center(
                        child: bodyFunction(context),
                      ),
                      // Expanded(child: bodyFunction(context)),
                    ],
                  ),
                ));
    } else {
      return HomeScreen();
    }
  }
}
