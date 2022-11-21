import 'package:flutter/material.dart';

class menuItem extends StatelessWidget {
  String title;
  final VoidCallback press;
  final Color color;
  menuItem({
    Key? key,
    required this.title,
    required this.press,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
