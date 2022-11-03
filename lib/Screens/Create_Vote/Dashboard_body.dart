import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../Components/ฺButton.dart';
import '../Home/home_screen.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final user = FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection(user!).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;

                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data['Event Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            ListTile(
                              title: Text(data['Creator']),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
          }),
    );
  }
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