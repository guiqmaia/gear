import 'package:flutter/material.dart';

class MyCheckedBox extends StatefulWidget {
  const MyCheckedBox({Key? key}) : super(key: key);

  @override
  State<MyCheckedBox> createState() => _MyCheckedBoxState();
}

class _MyCheckedBoxState extends State<MyCheckedBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    
    Color getColor(Set<MaterialState> states) {
      return Colors.blue;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() => isChecked = value!);
      },
    );
  }
}
