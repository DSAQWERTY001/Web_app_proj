import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

class CardComp extends StatefulWidget {
  final String? TitleText;
  final String Descrip;
  const CardComp({super.key, required this.TitleText, required this.Descrip});

  @override
  State<CardComp> createState() => _CardCompState();
}

class _CardCompState extends State<CardComp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(350, 0, 350, 0),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 8.0,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.amber),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
          child: Container(
            child: ListTile(
                // enabled: true,
                enabled: false,
                onTap: () async {
                  await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('AlertDialog Title'),
                      content: const Text('AlertDialog description'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.amber))),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Status\n  ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white)),
                      WidgetSpan(
                          child: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.red,
                      ))
                    ]))
                    // child: Icon(
                    //   Icons.autorenew,
                    //   color: Colors.white,
                    // ),
                    ),
                title: Text(
                  "TitleText",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                subtitle: Row(
                  children: <Widget>[
                    Icon(Icons.linear_scale, color: Colors.yellowAccent),
                    Text(" Intermediate", style: TextStyle(color: Colors.white))
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.white, size: 30.0)),
          ),
        );
      },
    );
  }
}

class CardExpo extends StatelessWidget {
  final String TextTitle;
  final String Descrip;
  final bool check;
  final DateTime StaDate;
  final DateTime EndDate;
  final List<dynamic> Candi;
  final List<dynamic> score;
  final List<dynamic> winner;
  final int allvoter;
  final String doc;
  const CardExpo({
    Key? key,
    required this.TextTitle,
    required this.Descrip,
    required this.check,
    required this.StaDate,
    required this.EndDate,
    required this.Candi,
    required this.score,
    required this.winner,
    required this.allvoter,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<dynamic> alldata = [];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: MediaQuery.of(context).size.width < 1200
          ? (MediaQuery.of(context).size.width < 1000
              ? (MediaQuery.of(context).size.width >= 800
                  ? EdgeInsets.fromLTRB(100, 0, 100, 0)
                  : EdgeInsets.fromLTRB(50, 0, 50, 0))
              : (EdgeInsets.fromLTRB(150, 0, 150, 0)))
          : (EdgeInsets.fromLTRB(250, 0, 250, 0)),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 8.0,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.amber),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
          child: Container(
            child: ListTile(
              // enabled: true,
              enabled: check,
              onTap: () async {
                showLoadingDialog(context);
              },
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right:
                              new BorderSide(width: 1.0, color: Colors.amber))),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Status\n  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white)),
                    WidgetSpan(
                        child: Icon(
                      Icons.fiber_manual_record,
                      color: check ? Colors.green : Colors.red,
                    ))
                  ]))
                  // child: Icon(
                  //   Icons.autorenew,
                  //   color: Colors.white,
                  // ),
                  ),
              title: Text(
                TextTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Row(
                children: <Widget>[
                  // Icon(Icons.linear_scale, color: Colors.yellowAccent),
                  Column(
                    children: [
                      Text("Start : " + StaDate.toString().substring(0, 16),
                          style: TextStyle(color: Colors.white70)),
                      Text("End   : " + EndDate.toString().substring(0, 16),
                          style: TextStyle(color: Colors.white70))
                    ],
                  ),
                ],
              ),
              trailing: InkWell(
                onTap: () async {
                  Dialogcon(context);
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> Dialogcon(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Alert"),
        content: Text("Do you want to Delete"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'cancel',
              // style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              showRepageDialog(context);
              FirebaseFirestore.instance
                  .collection("EventCreate")
                  .doc(doc)
                  .delete();
              final response = Http.get(Uri.parse(
                  'https://e-voting-api-kmutnb-ac-th.vercel.app/eventEnd/$TextTitle'));
              Navigator.pop(context);
            },
            child: const Text(
              'Comfirm',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showLoadingDialog(BuildContext context) async {
    String s = "";
    String ts = "";
    String tn = "";
    const initialValue = 0.0;
    final resultvoted = score.fold<double>(
        initialValue, (previousValue, element) => previousValue + element);
    if (winner.length > 1) {
      s = ",";
    }
    if (StaDate.minute < 10) {
      ts = "0";
    }
    if (EndDate.minute < 10) {
      tn = "0";
    }
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(child: Text(TextTitle)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (Descrip != "") (Text(Descrip + "\n")),
              Container(
                child: Row(
                  children: [
                    Text("winner : "),
                    Expanded(
                      child: Row(
                        children: winner
                            .map((e) => Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Text(e + s),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    )
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("All Voter : " + allvoter.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text("All Voted : " + resultvoted.toInt().toString()),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Candidate"),
                Text("Score"),
              ]),
              SizedBox(
                height: 13,
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: Candi.map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text("  " + e + "\n"),
                            ),
                            SizedBox(
                              width: 40,
                            )
                          ],
                        )).toList(),
                  ),
                  Column(
                    children: score
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(e.toString() + "  " + "\n"),
                              ],
                            ))
                        .toList(),
                  ),
                ],
              )),
              // Text("${alldata.length}"),
              Text("Start : " + StaDate.toString().substring(0, 16) + "\n"),
              Text("End   : " + EndDate.toString().substring(0, 16) + "\n"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static Future<void> showRepageDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: const Text('Please Wait a minute'),
        children: [
          Container(
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  // Future<QuerySnapshot?> getData() async {
  //   List<dynamic> alldata = [];
  //   final user = FirebaseAuth.instance.currentUser?.email;
  //   final dataofItem = FirebaseFirestore.instance
  //       .collection(user!)
  //       .where(TextTitle)
  //       .get()
  //       .then((QuerySnapshot? querySnapshot) {
  //     querySnapshot!.docs.forEach((doc) {
  //       alldata = doc["Candidate"];
  //       print("allData = $alldata");
  //       // print("getData = ${doc["item_text_"]}");
  //     });
  //   });
  //   return dataofItem;
  // }
}
