// ignore_for_file: deprecated_member_use

import 'package:awesome_select/awesome_select.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:web_prototype/Screens/Create_Vote/checkbox.dart';
import '../Components/ฺButton.dart';
import '../Home/home_screen.dart';
import 'package:near_api_flutter/near_api_flutter.dart';
import 'package:parent_child_checkbox/parent_child_checkbox.dart';
// import 'package:fluent_ui/fluent_ui.dart' as fluent;

import 'addTextField.dart';

class CreateBody extends StatefulWidget {
  static const String route = '/create-vote';
  CreateBody({Key? key}) : super(key: key);

  @override
  State<CreateBody> createState() => _CreateBodyState();
}

class _CreateBodyState extends State<CreateBody> {
  final user = FirebaseAuth.instance.currentUser?.email;
  List<String> Candidate_name = [];
  List<String> _selectedItems = [];
  late List<Map<String, dynamic>> _values;
  DateTime SdateTime = DateTime.now();
  DateTime EdateTime = DateTime.now();
  late int _count;
  int? selectId;
  int addtextIndex = 1;
  String? selectedValue;
  // static List<Faculty> _faculty = [
  //   Faculty(
  //     id: 1,
  //     name: "คณะครุศาสตร์อุตสาหกรรม",
  //   ),
  //   Faculty(id: 2, name: "คณะวิศวกรรม"),
  //   Faculty(id: 3, name: "คณะวิทยาศาสตร์ประยุกต์"),
  //   Faculty(id: 4, name: "วิทยาลัยเทคโนโลยีอุตสาหกรรม"),
  //   Faculty(id: 5, name: "คณะเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล"),
  //   Faculty(id: 6, name: "คณะศิลปศาสตร์ประยุกต์"),
  //   Faculty(id: 7, name: "The Sirindhorn TGGS"),
  //   Faculty(id: 8, name: "คณะสถาปัตยกรรมและการออกแบบ"),
  //   Faculty(id: 9, name: "วิทยาลัยนานาชาติ"),
  //   Faculty(id: 10, name: "คณะพัฒนาธุรกิจและอุตสาหกรรม"),
  //   Faculty(id: 11, name: "บัณฑิตวิทยาลัย"),
  // ];
  List<Map> valueSelect = [
    {
      'name': 'Faculty',
      'isCheck': false,
    },
    {
      'name': 'Part of faculty',
      'isCheck': false,
    },
    {
      'name': 'Id Student',
      'isCheck': false,
    },
  ];
  List<Map> fac = [
    {"name": "คณะครุศาสตร์อุตสาหกรรม", "isChecked": false},
    {"name": "คณะวิศวกรรมศาสต", "isChecked": false},
    {
      "name": "วิทยาลัยเทคโนโลยีอุตสาหกรรม",
      "isChecked": false,
    },
    {"name": "คณะเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล", "isChecked": false},
    {"name": "คณะศิลปศาสตร์ประยุกต์", "isChecked": false},
    {"name": "The Sirindhorn TGGS", "isChecked": false},
    {"name": "คณะสถาปัตยกรรมและการออกแบบ", "isChecked": false},
    {"name": "วิทยาลัยนานาชาติ", "isChecked": false},
    {"name": "คณะพัฒนาธุรกิจและอุตสาหกรรม", "isChecked": false},
    {"name": "บัณฑิตวิทยาลัย", "isChecked": false}
  ];
  // final _items = _faculty
  //     .map((faculty) => MultiSelectItem<Faculty>(faculty, faculty.name))
  //     .toList();
  List<Faculty> _selectedFaculty = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  String EventName = "";
  String EventDes = "";
  Map response = {};
  String contractId = 'friendbook.nearflutter.testnet';
  String mutateMethod = 'submitMessage';
  String viewMethod = 'getAllMessages';
  late Account connectedAccount;
  String userAccount = 'neararabic.testnet';
  final _textUserIdController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textUserIdController.text = "nearflutter.testnet";
    _count = 2;
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
                  Row(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 2 > _count ? 2 : _count,
                              itemBuilder: (context, int index) {
                                return addTextField(
                                    Candidate_name: Candidate_name,
                                    index: index);
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
                          if (_count > 2) {
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
                      if (EdateTime == SdateTime) {
                        EdateTime = EdateTime.add(const Duration(days: 1));
                      }
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
                      if (EdateTime == SdateTime) {
                        EdateTime = EdateTime.add(const Duration(days: 1));
                      }
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
        // Row(
        //   children: [
        //     RButton(
        //         str: "Enter",
        //         press: () async {
        //           String walletURL = 'https://wallet.testnet.near.org/login/?';
        //           String contractId = 'testb.qwerty_vote.testnet';
        //           String appTitle = 'Friendbook';
        //           String accountId = userAccount;
        //           String nearSignInSuccessUrl =
        //               'https://near-transaction-serializer.herokuapp.com/success';
        //           String nearSignInFailUrl =
        //               'https://near-transaction-serializer.herokuapp.com/failure';
        //           connectedAccount = NEARTester.loginWithFullAccess(
        //               walletURL,
        //               contractId,
        //               accountId,
        //               appTitle,
        //               nearSignInSuccessUrl,
        //               nearSignInFailUrl);
        //         },
        //         bColor: Colors.blue,
        //         tColor: Colors.white)
        //   ],
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        // Row(
        //   children: [
        //     RButton(
        //         str: "EEEEE",
        //         press: () async {
        //           String method = 'addMessage';
        //           String methodArgs = '{"Text":"Hello"}';
        //           String contractId = 'testb.qwerty_vote.testnet';
        //           Contract contract = Contract(contractId, connectedAccount);
        //           await contract.callFunction(method, methodArgs);
        //           setState(() {});
        //         },
        //         bColor: Colors.blue,
        //         tColor: Colors.white)
        //   ],
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        //ปุ่มสำหรับการสร้าง และยกเลิก event

        // SizedBox(
        //   height: 20,
        // ),
        // CheckSinglechoice(),
        Container(
          child: Row(
            children: List.generate(3, (index) {
              return Checkbox(
                value: selectId == index,
                onChanged: (checked) {
                  if (checked == true) {
                    setState(() => selectId = index);
                  }
                },
              );
            }),
            // children: List.generate(valueSelect.length, (index) {
            //   try {
            //     return CheckboxListTile(
            //         title: Text(valueSelect[index]['name']),
            //         value: valueSelect[index]['name'],
            //         onChanged: (value) {
            //           setState(() {
            //             for (var element in valueSelect) {
            //               element['isCheck'] = false;
            //             }
            //             valueSelect[index]['isCheck'] = value;
            //             selectId = valueSelect[index]['name'];
            //           });
            //         });
            //   } catch (error, stack) {
            //     print(stack);
            //     throw Exception(
            //         "Problem while JSON decoding results. [error=${error.toString()}]");
            //   }
            // }),
          ),
          // children: [],
          // children: List.generate(3, (index) {
          //   return Checkbox(
          //     value: selectId == index,
          //     onChanged: (checked) {
          //       if (checked == true) {
          //         setState(() => selectId = index);
          //       }
          //     },
          //   );
          // }),
        ),
        Container(
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RButton(
                    str: "Select Faculty",
                    press: _showMultiSelect,
                    bColor: Colors.blue,
                    tColor: Colors.white),
              ],
            )),
        SizedBox(
          height: 20,
        ),
        Container(
            width: 600,
            margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Wrap(
              spacing: 3,
              runSpacing: 5,
              // direction:
              //     _selectedItems.length < 3 ? Axis.horizontal : Axis.vertical,
              children: _selectedItems
                  .map((e) => Chip(
                        backgroundColor: Colors.grey.shade300,
                        label: Text(e),
                        onDeleted: () {
                          setState(() {
                            _selectedItems.remove(e);
                          });
                        },
                      ))
                  .toList(),
            )),
        Row(
          children: [
            RButton(
                str: "enter",
                press: () {
                  print(_selectedItems);
                },
                bColor: Colors.blue,
                tColor: Colors.white)
          ],
        ),
        SizedBox(
          height: 20,
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
                                onPressed: () async {
                                  FirebaseFirestore.instance
                                      .collection(user!)
                                      .add({
                                    'Event Name': EventName,
                                    'Description': EventDes,
                                    'Candidate':
                                        Candidate_name.getRange(0, _count),
                                    'Start Date': SdateTime,
                                    'End Date': EdateTime,
                                    'Creator': user,
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

  void _showMultiSelect() async {
    final List<String> facul = [
      "คณะครุศาสตร์อุตสาหกรรม",
      "คณะวิศวกรรมศาสตร์",
      "วิทยาลัยเทคโนโลยีอุตสาหกรรม",
      "คณะเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล",
      "คณะศิลปศาสตร์ประยุกต์",
      "The Sirindhorn TGGS",
      "คณะสถาปัตยกรรมและการออกแบบ",
      "วิทยาลัยนานาชาติ",
      "คณะพัฒนาธุรกิจและอุตสาหกรรม",
      "บัณฑิตวิทยาลัย",
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CheckBoxMultiChilde(data: facul, title: "Faculty");
      },
    );

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
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

class NEARTester {
  static loginWithLimitedAccess(walletURL, contractId, accountId, appTitle,
      signInSuccessUrl, signInFailureUrl) {
    // Generate Keys
    var keyPair = KeyStore.newKeyPair();

    // Open near wallet in default browser
    Account account = Account(
        accountId: accountId,
        keyPair: keyPair,
        provider: NEARTestNetRPCProvider());

    var wallet = Wallet(walletURL);
    wallet.connect(contractId, appTitle, signInSuccessUrl, signInFailureUrl,
        account.publicKey);

    return account; //connected account
  }

  static loginWithFullAccess(walletURL, contractId, accountId, appTitle,
      signInSuccessUrl, signInFailureUrl) {
    // Generate Keys
    var keyPair = KeyStore.newKeyPair();
    var publicKey = KeyStore.publicKeyToString(keyPair.publicKey);

    // Open near wallet in default browser
    var wallet = Wallet(walletURL);

    wallet.connectWithFullAccess(
        contractId, appTitle, signInSuccessUrl, signInFailureUrl, publicKey);

    Account account = Account(
        accountId: accountId,
        keyPair: keyPair,
        provider: NEARTestNetRPCProvider());

    return account; //connected account
  }

  //contract holds the account to use for calling
  static callMethodLimitedAccess(Contract contract, String method, args) async {
    var result = await contract.callFunction(method, args);
    return result;
  }

  static callViewMethod(Contract contract, String method, args) async {
    var result = await contract.callViewFuntion(method, args);
    return result;
  }

  //contract holds the account to use for calling - account must have a full access key
  static callMethodFullAccess(Contract contract, String method, args) async {
    await contract.callFunction(method, args);
  }

  static callMethodFullAccessWithDeposit(
      Contract contract, String method, args, nearAmount) async {
    var result = await contract.callFunction(method, args, nearAmount);
    return result;
  }

  static callMethodLimitedAccessWithDeposit(
      Contract contract,
      String method,
      String walletURL,
      args,
      nearAmount,
      successUrl,
      failureUrl,
      approvalURL) async {
    // Open near wallet in default browser
    var wallet = Wallet(walletURL);

    var result = await contract.callFunctionWithDeposit(
        method, args, wallet, nearAmount, successUrl, failureUrl, approvalURL);
    return result;
  }

  static transferNear(Account account, nearAmount, receiver) async {
    var result = await account.sendTokens(nearAmount, receiver);
    return result;
  }
}

class CheckSinglechoice extends StatefulWidget {
  CheckSinglechoice({Key? key}) : super(key: key);

  @override
  State<CheckSinglechoice> createState() => _CheckSinglechoiceState();
}

class _CheckSinglechoiceState extends State<CheckSinglechoice> {
  String selected = "";

  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Faculty",
    },
    {
      "id": 1,
      "value": false,
      "title": "Part of Faculty",
    },
    {
      "id": 2,
      "value": false,
      "title": "Id Student",
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        checkListItems.length,
        (index) => CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          dense: true,
          title: Text(
            checkListItems[index]["title"],
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          value: checkListItems[index]["value"],
          onChanged: (value) {
            setState(() {
              for (var element in checkListItems) {
                element["value"] = false;
              }
              checkListItems[index]["value"] = value;
              selected =
                  "${checkListItems[index]["id"]}, ${checkListItems[index]["title"]}, ${checkListItems[index]["value"]}";
            });
          },
        ),
      ),
    );
  }
}
