import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "home page".toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .headline2
              ?.copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
