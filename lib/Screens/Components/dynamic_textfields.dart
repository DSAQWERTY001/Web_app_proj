import 'package:flutter/material.dart';

class addTextfields extends StatefulWidget {
  final int index;
  addTextfields({Key? key, required this.index}) : super(key: key);

  @override
  State<addTextfields> createState() => _nameState();
}

class _nameState extends State<addTextfields> {
  @override
  Widget build(BuildContext context) {
    return TextField(
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
        labelText: "Candidate",
        labelStyle: TextStyle(color: Colors.blue),
        icon: Icon(
          Icons.person_outline,
          color: Colors.blue,
        ),
      ),
    );
  }
}
