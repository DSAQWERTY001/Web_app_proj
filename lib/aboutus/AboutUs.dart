import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: Image.asset(
                    "assets/images/ing.jpg",
                    width: width * 0.6,
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Thanatron Therjuntuek",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          color: Colors.white),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "6203051623021 EnET-C KMUTNB",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        )),
                  ],
                ),
              ),
            ],
          )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Image.asset(
                  "assets/images/mike.jpg",
                  width: width * 0.6,
                )),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Teerapong Boontool",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Colors.white),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        "6203051000000 EnET-C KMUTNB",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Container(
            decoration: BoxDecoration(color: Color.fromARGB(60, 0, 0, 0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageChildren(constraints.biggest.width / 2),
            ),
          );
        } else {
          return Container(
              decoration: BoxDecoration(color: Color.fromARGB(60, 0, 0, 0)),
              child: Column(
                children: pageChildren(constraints.biggest.width),
              ));
        }
      },
    );
  }
}
