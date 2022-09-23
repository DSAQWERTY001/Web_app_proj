import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_prototype/Screens/Components/app_bar.dart';
import 'package:web_prototype/Screens/Components/voteappbar.dart';
import '../Components/ฺButton.dart';
import '../Home/home_screen.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:web_prototype/Screens/Create_Vote/create_vote_body.dart';

class createVoteScreen extends StatefulWidget {
  const createVoteScreen({Key? key}) : super(key: key);

  @override
  State<createVoteScreen> createState() => _createVoteScreenState();
}

class _createVoteScreenState extends State<createVoteScreen> {
  late int _count;
  DateTime SdateTime = DateTime.now();
  DateTime EdateTime = DateTime.now();
  int _page = 0;
  static List<Faculty> _faculty = [
    Faculty(id: 1, name: "คณะครุศาสตร์อุตสาหกรรม"),
    Faculty(id: 2, name: "คณะวิศวกรรมศาสตร"),
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
  Widget bodyFunction(BuildContext context) {
    switch (_page) {
      case 0:
        return Container();
        break;
      case 1:
        return CreateBody();
        break;
      default:
        return Container();
        break;
    }
  }

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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                RButton(
                  str: "Dashboard",
                  press: () {
                    setState(() {
                      _page = 0;
                    });
                  },
                  bColor: _page == 0 ? Colors.blue : Colors.grey.shade200,
                  tColor: _page == 0 ? Colors.white : Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                RButton(
                  str: "Create",
                  press: () {
                    SdateTime = DateTime.now();
                    EdateTime = DateTime.now();
                    _count = 0;
                    setState(() {
                      _page = 1;
                    });
                  },
                  bColor: _page == 0 ? Colors.grey.shade200 : Colors.blue,
                  tColor: _page == 0 ? Colors.blue : Colors.white,
                ),
              ],
            ),
            bodyFunction(context),
          ],
        ),
      ),
    );
  }
}
