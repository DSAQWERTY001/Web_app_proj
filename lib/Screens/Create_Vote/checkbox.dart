import 'package:flutter/material.dart';
import 'package:web_prototype/Screens/Components/%E0%B8%BAButton.dart';

class CheckBoxMultiChilde extends StatefulWidget {
  final List<String> data;
  final String title;
  const CheckBoxMultiChilde({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  @override
  State<CheckBoxMultiChilde> createState() => _CheckBoxMultiChildeState();
}

class _CheckBoxMultiChildeState extends State<CheckBoxMultiChilde> {
  final List<String> _selectedItems = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.data
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancle')),
        RButton(
            str: "Submit",
            press: () {
              Navigator.pop(context, _selectedItems);
            },
            bColor: Colors.blue,
            tColor: Colors.white)
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.pop(context, _selectedItems);
        //     },
        //     child: const Text('Submit'))
      ],
    );
  }

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }
}
// ListBody(
//           children: widget.data.map((data) {
//         return CheckboxListTile(
//             value: data["isChecked"],
//             title: Text(data["name"]),
//             onChanged: (newValue) {
//               setState(() {
//                 data["isChecked"] = newValue;
//               });
//             });
//       }).toList()),
