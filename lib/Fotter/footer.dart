import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: new Container(
          height: 180.0,
          color: Colors.black,
          child: new Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: new Container(
                    margin: EdgeInsets.all(20.0),
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Social media",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Facebook",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )),
              new SizedBox(
                width: 20.0,
              ),
              Expanded(
                  flex: 1,
                  child: new Container(
                    margin: EdgeInsets.all(20.0),
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Thanatron Therjuntuek",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await launchUrl(Uri.parse(
                                "https://www.facebook.com/IngThanatron"));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text(
                              "Ing Thanatron",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Thanatron.ther@gmail.com",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
              new SizedBox(
                width: 20.0,
              ),
              Expanded(
                  flex: 1,
                  child: new Container(
                    margin: EdgeInsets.all(20.0),
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Teerapong Boontool",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await launchUrl(Uri.parse(
                                "https://www.facebook.com/teerapong.tuem"));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text(
                              "Teerapong Boontool",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "trpng.bt@gmail.com",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )),
              new SizedBox(
                width: 20.0,
              ),
            ],
          )),
    );
  }
}
