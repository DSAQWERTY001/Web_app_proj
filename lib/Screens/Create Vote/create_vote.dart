import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_prototype/Screens/Components/app_bar.dart';
import 'package:web_prototype/Screens/Components/dynamic_textfields.dart';
import 'package:web_prototype/Screens/Components/voteappbar.dart';

import '../Home/home_screen.dart';

class createVoteScreen extends StatefulWidget {
  const createVoteScreen({Key? key}) : super(key: key);

  @override
  State<createVoteScreen> createState() => _createVoteScreenState();
}

class _createVoteScreenState extends State<createVoteScreen> {
  late int _count;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyWidget(),
            Column(
              children: [
                Container(
                  width: 600,
                  child: Column(
                    children: [
                      TextField(
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.amber, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                          ),
                          labelText: "Event Name",
                          labelStyle: TextStyle(color: Colors.blue),
                          icon: Icon(
                            Icons.create_new_folder_outlined,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      _addTextfields("candidate"),
                      _addTextfields("candidate"),
                      Row(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _count,
                                  itemBuilder: (context, index) {
                                    return _addTextfields("candidate");
                                  }))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 600,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              _count++;
                            });
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              if (_count > 0) {
                                _count--;
                              }
                            });
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: FlatButton(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 15),
                                    color: Colors.blue,
                                    onPressed: () {},
                                    child: Text(
                                      "Create Event",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: FlatButton(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 15),
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
                                    },
                                    child: Text(
                                      "Cancel Event",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _addTextfields(String str) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
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
            labelText: 'cadidate',
            labelStyle: TextStyle(color: Colors.blue),
            icon: Icon(
              Icons.person_outline,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
