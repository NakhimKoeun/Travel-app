import 'package:flutter/material.dart';
import 'package:travelapp/widget/textapp.dart';

class AppBottom extends StatelessWidget {
  AppBottom(
      {super.key,
      this.Isicon = false,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size,
      this.text = 'hi',
      this.icon});
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final String? text;
  final IconData? icon;
  bool Isicon;
  double size;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor),
        child: Isicon == false
            ? Center(
                child: textapp(
                  text: text!,
                  color: Colors.white,
                ),
              )
            : Center(
                child: Icon(
                icon,
                color: color,
              )));
  }
}
