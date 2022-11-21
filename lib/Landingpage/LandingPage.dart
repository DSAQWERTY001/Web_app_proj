import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Mobile \nElectronic voting",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.white),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Application E-Voting using Near protocol Blockchain build by 2 KMUTNB student Thanatron and Teerapong Advice by Dr.Choopan",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                )),
            MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () async {
                await launchUrl(Uri.parse(
                    "https://drive.google.com/file/d/1gXNsSODjIdN8PUBIJM8jlOXMeT7j9_5E/view?usp=sharing"));
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: Text(
                    "Go to voting",
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
          ),
          child: Image.asset(
            "assets/images/EVote.png",
            width: width,
          ))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
