import 'package:flutter/material.dart';

class BarScreen extends StatelessWidget {
  const BarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        "Bar Screen",
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
