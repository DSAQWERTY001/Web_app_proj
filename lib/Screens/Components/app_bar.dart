// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:web_prototype/Screens/Components/%E0%B8%BAButton.dart';
import 'package:web_prototype/Screens/Components/login_state.dart';
import 'package:web_prototype/Screens/Components/menu_item.dart';
import 'package:web_prototype/Screens/Create%20Vote/create_vote.dart';
import 'package:web_prototype/Screens/Home/home_screen.dart';

import '../Login/login_screen.dart';

class VoteAppBar extends StatelessWidget {
  const VoteAppBar({Key? key}) : super(key: key);

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
          if (GlobalValues.getLoginStatus())
            (menuItem(
              title: "Creation Vote",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => createVoteScreen()),
                );
              },
            )),
          menuItem(
            title: "home".toUpperCase(),
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          menuItem(title: "about us".toUpperCase(), press: () {}),
          if (GlobalValues.getLoginStatus())
            (RButton(
                str: "logout".toUpperCase(),
                press: () {
                  GlobalValues.setLoginStatus(false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                bColor: Colors.white,
                tColor: Colors.blue))
          else
            (RButton(
                str: "login".toUpperCase(),
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                bColor: Colors.white,
                tColor: Colors.blue)),
        ],
      ),
    );
  }
}
