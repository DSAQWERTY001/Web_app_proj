import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_prototype/Screens/Components/ButtonIcon.dart';
import 'package:web_prototype/Screens/Components/app_bar.dart';
import 'package:web_prototype/Screens/Components/dynamic_textfields.dart';
import 'package:web_prototype/Screens/Components/voteappbar.dart';
import '../Components/ฺButton.dart';
import '../Home/home_screen.dart';

class createVoteScreen extends StatefulWidget {
  const createVoteScreen({Key? key}) : super(key: key);

  @override
  State<createVoteScreen> createState() => _createVoteScreenState();
}

class _createVoteScreenState extends State<createVoteScreen> {
  late int _count;
  DateTime SdateTime = DateTime.now();
  DateTime EdateTime = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    final hours = SdateTime.hour.toString().padLeft(2, '0');
    final minutes = SdateTime.minute.toString().padLeft(2, '0');
    final Ehours = EdateTime.hour.toString().padLeft(2, '0');
    final Eminutes = EdateTime.minute.toString().padLeft(2, '0');
    final deferDay = defDay(SdateTime, EdateTime);
    final deferTime = defTime(SdateTime, EdateTime);
    final deferTimeMinute = defTimeMinutes(SdateTime, EdateTime);
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
                      SizedBox(
                        height: 100,
                      ),
                      //สร้าง textfield ,event name,Event Description,candidate
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
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
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
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
                          labelText: "Event Description",
                          labelStyle: TextStyle(color: Colors.blue),
                          icon: Icon(
                            Icons.description_outlined,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.black87,
                        endIndent: 15,
                        indent: 55,
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
            //ปุ่มสำหรับการเพิ่มและลบ textfield candidate ที่เพิ่มขี้นมา
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RButton(
                        str: "Add",
                        press: () {
                          setState(() {
                            _count++;
                          });
                        },
                        bColor: Colors.blue,
                        tColor: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RButton(
                        str: "Delete",
                        press: () {
                          setState(
                            () {
                              if (_count > 0) {
                                _count--;
                              }
                            },
                          );
                        },
                        bColor: Colors.red,
                        tColor: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //เวลาเริ่มของ event
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start   :  ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      RButtonIcon(
                        str:
                            '${SdateTime.day}/${SdateTime.month}/${SdateTime.year}',
                        press: () async {
                          final date = await pickDate();
                          if (date == DateTime.now())
                            return setState(() => SdateTime = DateTime.now());
                          if (date == null ||
                              date.isBefore(DateTime.now()) == true) return;
                          setState(() => SdateTime = date);
                        },
                        bColor: Colors.blue,
                        tColor: Colors.white,
                        bIcon: Icons.calendar_month_outlined,
                        iColor: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RButtonIcon(
                        str: '$hours : $minutes',
                        press: () async {
                          final time = await pickTime();
                          if (time == null) return;
                          final newDateTime = DateTime(
                              SdateTime.year,
                              SdateTime.month,
                              SdateTime.day,
                              time.hour,
                              time.minute);
                          setState(() => SdateTime = newDateTime);
                        },
                        bColor: Colors.blue,
                        tColor: Colors.white,
                        bIcon: Icons.access_time,
                        iColor: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //เวลาจบของ event
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'End   :    ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      RButtonIcon(
                        str:
                            '${EdateTime.day}/${EdateTime.month}/${EdateTime.year}',
                        press: () async {
                          final date = await pickDate();
                          if (date == SdateTime)
                            return setState(() => EdateTime = SdateTime);
                          if (date == null || date.isBefore(SdateTime) == true)
                            return;
                          setState(() => EdateTime = date);
                        },
                        bColor: Colors.blue,
                        tColor: Colors.white,
                        bIcon: Icons.calendar_month_outlined,
                        iColor: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RButtonIcon(
                        str: '$Ehours : $Eminutes',
                        press: () async {
                          final time = await EpickTime();
                          if (time == null) return;
                          final newDateTime = DateTime(
                              EdateTime.year,
                              EdateTime.month,
                              EdateTime.day,
                              time.hour,
                              time.minute);
                          setState(() => EdateTime = newDateTime);
                        },
                        bColor: Colors.blue,
                        tColor: Colors.white,
                        bIcon: Icons.access_time,
                        iColor: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            //ปุ่มสำหรับการสร้าง และยกเลิก event
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
                                RButton(
                                    str: "Cancel Event",
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
                                    },
                                    bColor: Colors.red,
                                    tColor: Colors.white),
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

  //widget สร้าง textfield candidate
  _addTextfields(String str) {
    return Column(
      children: [
        SizedBox(
          height: 10,
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
            labelText: 'candidate',
            labelStyle: TextStyle(color: Colors.blue),
            icon: Icon(
              Icons.person_outline,
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  //widget การดึงค่าจองเวลา
  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: SdateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100));
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: SdateTime.hour, minute: SdateTime.minute));
  Future<DateTime?> EpickDate() => showDatePicker(
      context: context,
      initialDate: SdateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100));
  Future<TimeOfDay?> EpickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: EdateTime.hour, minute: EdateTime.minute));
  int defDay(DateTime start, DateTime end) {
    start = DateTime(start.year, start.month, start.day);
    end = DateTime(end.year, end.month, end.day);
    return (end.difference(start).inHours / 24).round();
  }

  //widget ความต่างของเวลา
  int defTimeMinutes(DateTime start, DateTime end) {
    start =
        DateTime(start.year, start.month, start.day, start.hour, start.minute);
    end = DateTime(end.year, end.month, end.day, end.hour, end.minute);
    return (end.difference(start).inMinutes % 60).round();
  }

  int defTime(DateTime start, DateTime end) {
    start =
        DateTime(start.year, start.month, start.day, start.hour, start.minute);
    end = DateTime(end.year, end.month, end.day, end.hour, end.minute);
    return (end.difference(start).inHours).round();
  }
}
