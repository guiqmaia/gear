import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class BtnStandardApp extends StatelessWidget {
  final String title;
  final dynamic pageRoute;
  final dynamic widthBtn;
  final dynamic heightBtn;
  final double fontSize;
  final Color backgroundColorBtn;
  final Color fontColorBtn;
  Function? onPressed;

  BtnStandardApp({
    Key? key,
    required this.title,
    this.pageRoute,
    required this.widthBtn,
    this.heightBtn,
    this.fontSize = 18,
    this.onPressed,
    this.backgroundColorBtn = const Color.fromRGBO(202, 254, 72, 1),
    this.fontColorBtn = Colors.black,
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
          if (pageRoute == null) {
            Navigator.of(context).pop(context);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => pageRoute,
              ),
            );
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
