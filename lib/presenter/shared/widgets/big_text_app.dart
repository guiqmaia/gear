import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigTextApp extends StatelessWidget {
 late String text = '';
  BigTextApp({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const  TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}