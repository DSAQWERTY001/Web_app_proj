import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../Components/ฺButton.dart';
import '../Home/home_screen.dart';

class CreateBody extends StatefulWidget {
  static const String route = '/create-vote';
  CreateBody({Key? key}) : super(key: key);

  @override
  State<CreateBody> createState() => _CreateBodyState();
}

class _CreateBodyState extends State<CreateBody> {
  CollectionReference data = FirebaseFirestore.instance.collection("Event");
  List<String> Candidate_name = [];
  DateTime SdateTime = DateTime.now();
  DateTime EdateTime = DateTime.now();
  late int _count;
  int addtextIndex = 1;
  String? selectedValue;
  static List<Faculty> _faculty = [
    Faculty(id: 1, name: "คณะครุศาสตร์อุตสาหกรรม"),
    Faculty(id: 2, name: "คณะวิศวกรรม"),
    Faculty(id: 3, name: "คณะวิทยาศาสตร์ประยุกต์"),
    Faculty(id: 4, name: "วิทยาลัยเทคโนโลยีอุตสาหกรรม"),
    Faculty(id: 5, name: "คณะเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล"),
    Faculty(id: 6, name: "คณะศิลปศาสตร์ประยุกต์"),
    Faculty(id: 7, name: "The Sirindhorn TGGS"),
    Faculty(id: 8, name: "คณะสถาปัตยกรรมและการออกแบบ"),
    Faculty(id: 9, name: "วิทยาลัยนานาชาติ"),
    Faculty(id: 10, name: "คณะพัฒนาธุรกิจและอุตสาหกรรม"),
    Faculty(id: 11, name: "บัณฑิตวิทยาลัย"),
  ];
  final _items = _faculty
      .map((faculty) => MultiSelectItem<Faculty>(faculty, faculty.name))
      .toList();
  List<Faculty> _selectedFaculty = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
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
    String EventName = "";
    String EventDes = "";
    String can1 = "";
    String can2 = "";
    return Column(
      children: [
        Column(
          children: [
            Container(
              width: 600,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Event",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //สร้าง textfield ,event name,Event Description,candidate
                  TextField(
                    onChanged: (value) {
                      EventName = value;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      labelText: "Event Name",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 127, 197, 255)),
                      icon: Icon(
                        Icons.create_new_folder_outlined,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (value) {
                      EventDes = value;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      labelText: "Event Description",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 127, 197, 255)),
                      icon: Icon(
                        Icons.description_outlined,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Candidate",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  _addTextfields(0),
                  _addTextfields(1),
                  Row(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _count,
                              itemBuilder: (context, Index) {
                                return _addTextfields(Index);
                              }))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        //ปุ่มสำหรับการเพิ่มและลบ textfield candidate ที่เพิ่มขี้นมา
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width < 600
                  ? MediaQuery.of(context).size.width
                  : 600,
              child: Row(
                mainAxisAlignment: MediaQuery.of(context).size.width > 300
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.center,
                children: [
                  RButton(
                    str: "Add",
                    press: () {
                      setState(() {
                        _count++;
                        addtextIndex++;
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
                            addtextIndex--;
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
          height: 10,
        ),
        Text(
          "Date & Time",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        //เวลาเริ่มของ event
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 450,
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
                      if (date == null || date.isBefore(DateTime.now()) == true)
                        return;
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
              width: 450,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'End   :  ',
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
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          child: Column(
            children: <Widget>[
              MultiSelectDialogField(
                dialogWidth: MediaQuery.of(context).size.width * 0.25,
                dialogHeight: MediaQuery.of(context).size.height * 0.50,
                items: _items,
                title: Text("Faculty"),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                buttonIcon: Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Colors.blue,
                ),
                buttonText: Text(
                  "Selete Faculty",
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 16,
                  ),
                ),
                onConfirm: (Results) {
                  List<Faculty> tempSelectedFaculty = [];
                  Results as List<MultiSelectItem<Faculty>>;
                  Results.forEach((element) {
                    tempSelectedFaculty.add(element.value);
                  });
                  _selectedFaculty = tempSelectedFaculty;
                },
                chipDisplay: MultiSelectChipDisplay(
                  textStyle: TextStyle(fontSize: 12),
                  onTap: (value) {
                    setState(() {
                      _selectedFaculty.remove(value);
                    });
                  },
                ),
              ),
            ],
          ),
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
                                onPressed: () async {
                                  data.doc(EventName).set({
                                    'Event Name': EventName,
                                    'Description': EventDes,
                                    'Candidate': Candidate_name.getRange(
                                        0, Candidate_name.length)
                                  });
                                  Navigator.pushNamed(context, '/vote/create');
                                },
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

//widget สร้าง textfield candidate
  _addTextfields(int index) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (value) {
            Candidate_name.insert(index, value);
          },
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: TextStyle(fontSize: 16, color: Colors.black),
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
            labelStyle: TextStyle(color: Color.fromARGB(255, 127, 197, 255)),
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
}

class Faculty {
  final int id;
  final String name;

  Faculty({
    required this.id,
    required this.name,
  });
}
