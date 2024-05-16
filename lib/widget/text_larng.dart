import 'package:flutter/material.dart';

// ignore: must_be_immutable
class text_larng extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  text_larng(
      {super.key,
      required this.text,
      this.color = Colors.white,
      this.size = 30});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
