import 'package:flutter/material.dart';
import '../../../core/app_assets.dart';

class BtnStandardApp extends StatelessWidget {
  final String title;
  final dynamic pageRoute;
  final dynamic widthBtn;
  Function? onPressed;

  BtnStandardApp({
    Key? key,
    required this.title,
    this.pageRoute,
    required this.widthBtn,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greenNeon,
      ),
      margin: const EdgeInsets.all(15),
      width: widthBtn,
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
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
