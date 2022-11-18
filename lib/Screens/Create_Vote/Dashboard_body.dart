import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:web_prototype/Screens/Components/Cardcomp.dart';
import '../Components/ฺButton.dart';
import '../Home/home_screen.dart';
import 'package:http/http.dart' as Http;

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<dynamic> alldata = [];
  final user = FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("EventCreate")
              .orderBy('Start Date', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return !snapshot.hasData
                ? Center(
                    child: Center(
                    child: Text("Not Found"),
                  ))
                : ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      // FirebaseFirestore.instance
                      //     .collection(user!)
                      //     .get()
                      //     .then((QuerySnapshot? querySnapshot) {
                      //   querySnapshot!.docs.forEach((doc) {
                      //     if (alldata.length < 1) {
                      //       alldata = doc["Candidate"];
                      //     }
                      //     print("allData = $alldata");
                      //     //  print("getData = ${doc["item_text_"]}");
                      //   });
                      // });

                      Map<String, dynamic> dataM =
                          document.data()! as Map<String, dynamic>;
                      List<dynamic> vot = dataM['Voter'];
                      // List<dynamic> dataArray =
                      //     List.from(snapshot.data['score']);
                      Timestamp ts = dataM['Start Date'] as Timestamp;
                      Timestamp te = dataM['End Date'] as Timestamp;
                      bool check;
                      DateTime sdate = ts.toDate();
                      DateTime edate = te.toDate();
                      FirebaseFirestore.instance.collection(user!).get();
                      // print(dataM['Candidate']);
                      // print(dataM['Event Name']);
                      // print(dataM['Description']);
                      // print(sdate);
                      // print(d);
                      // var Data = dataM;
                      // print(Data);
                      // int score = data['score'];
                      // List<int> score = data['score'];
                      // List score = dataM['Voter'];
                      // getData();
                      if (DateTime.now().isAfter(edate)) {
                        Future getscoreVote() async {
                          final responseScore = await Http.get(Uri.parse(
                              'https://e-voting-api-kmutnb-ac-th.vercel.app/getEventScore/${dataM['Event Name']}'));
                          final responseWinner = await Http.get(Uri.parse(
                              'https://e-voting-api-kmutnb-ac-th.vercel.app/winner/${dataM['Event Name']}'));
                          var data_score = jsonDecode(responseScore.body);
                          var data_winner = jsonDecode(responseWinner.body);
                          FirebaseFirestore.instance
                              .collection("EventCreate")
                              .doc(document.id)
                              .update({
                            'Score': data_score["score"],
                            'winner': data_winner["winner"]
                          });
                        }

                        getscoreVote();
                      }

                      check = DateTime.now().isAfter(edate) ? true : false;
                      if (dataM['Creator'] == user) {
                        return Container(
                          child: CardExpo(
                            TextTitle: dataM['Event Name'],
                            Descrip: dataM['Description'],
                            check: check,
                            StaDate: sdate,
                            EndDate: edate,
                            Candi: dataM['Candidate'],
                            score: dataM['Score'],
                            winner: dataM['winner'],
                            allvoter: vot.length,
                          ),
                          // child: Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     SizedBox(
                          //       height: 20,
                          //     ),
                          //     CardComp(),
                          //     Text(
                          //       data['Event Name'],
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.bold, fontSize: 15),
                          //     ),
                          //     Text(data['Description']),
                          //     Text('${sdate}'),
                          //     Text('${edate}'),
                          //   ],
                          // ),
                        );
                      }
                      return Container();
                    }).toList(),
                  );
          }),
    );
    // return Scaffold(
    //   body: Container(
    //     child: CardComp(),
    //   ),
    // );
  }

  // Future<QuerySnapshot?> getData() async {
  //   final dataofItem = FirebaseFirestore.instance
  //       .collection(user!)
  //       .get()
  //       .then((QuerySnapshot? querySnapshot) {
  //     querySnapshot!.docs.forEach((doc) {
  //       alldata = doc["Candidate"];
  //       print("allData = $alldata");
  //       //  print("getData = ${doc["item_text_"]}");
  //     });
  //   });
  //   return dataofItem;
  // }
}

// final user = FirebaseAuth.instance.currentUser?.email;

// class FireStoreDataBase {
//   List studentsList = [];
//   final CollectionReference collectionRef =
//       FirebaseFirestore.instance.collection(user!);

//    Future getData() async {
//     try {
//       //to get data from a single/particular document alone.
//       // var temp = await collectionRef.doc("<your document ID here>").get();

//       // to get data from all documents sequentially
//       await collectionRef.get().then((querySnapshot) {
//         for (var result in querySnapshot.docs) {
//           studentsList.add(result.data());
//         }
//       });

//       return studentsList;
//     } catch (e) {
//       debugPrint("Error - $e");
//       return e;
//     }
//   }
// }
