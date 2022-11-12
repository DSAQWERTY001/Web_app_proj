import 'package:flutter/material.dart';

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
  const CardExpo(
      {Key? key,
      required this.TextTitle,
      required this.Descrip,
      required this.check,
      required this.StaDate,
      required this.EndDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Text(Descrip, style: TextStyle(color: Colors.white70))
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.white, size: 30.0)),
          ),
        );
      },
    );
  }

  Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(TextTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Descrip + "\n"),
            Text(StaDate.toString() + "\n"),
            Text(EndDate.toString() + "\n"),
          ],
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
}
