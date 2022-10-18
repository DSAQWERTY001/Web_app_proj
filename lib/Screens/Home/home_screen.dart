import 'package:flutter/material.dart';
import 'package:web_prototype/Screens/Components/app_bar.dart';
import 'package:web_prototype/Screens/Components/body.dart';
import 'package:http/http.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          VoteAppBar(),
          Spacer(
            flex: 1,
          ),
          Body(),
          Spacer(),
        ]),
      ),
    );
  }
}
