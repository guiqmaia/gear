import 'package:flutter/material.dart';

class BtnStandardApp extends StatelessWidget {
  final String title;
  final dynamic pageRoute;
  final dynamic widthBtn;
  final dynamic heightBtn;
  final double fontSize;
  final Color backgroundColorBtn;
  final Color fontColorBtn;
  final Function? onPressed;
  final bool isReplacement;

  const BtnStandardApp({
    Key? key,
    required this.title,
    this.pageRoute,
    required this.widthBtn,
    this.heightBtn,
    this.fontSize = 18,
    this.backgroundColorBtn = const Color.fromRGBO(204, 225, 52, 1),
    this.fontColorBtn = Colors.black,
    this.onPressed,
    this.isReplacement = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColorBtn,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      width: widthBtn,
      height: heightBtn,
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      child: TextButton(
        onPressed: () {
          if (isReplacement) {
            Navigator.of(context).pushReplacementNamed(pageRoute);
          } else {
            Navigator.of(context).pushNamed(pageRoute);
          }
        },
        child: Text(
          title,
          style: TextStyle(
            color: fontColorBtn,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
