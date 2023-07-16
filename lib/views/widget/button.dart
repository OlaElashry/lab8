import 'package:flutter/material.dart';

class MyButn extends StatefulWidget {
  String text;
  Color ForeColor;
  Color backColor;
  MyButn(
      {super.key,
      required this.text,
      required this.ForeColor,
      required this.backColor});

  @override
  State<MyButn> createState() => _MyButnState();
}

class _MyButnState extends State<MyButn> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 40,
          child: Center(
              child: Text(
            widget.text,
            style: TextStyle(color: widget.ForeColor),
          )),
          decoration: BoxDecoration(
            color: widget.backColor,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
