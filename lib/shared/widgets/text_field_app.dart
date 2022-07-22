import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  final String labelItem;
  final dynamic typeController;
  bool isObscured = true;
  bool isEnabled;

  TextFieldApp({
    Key? key,
    required this.labelItem,
    required this.typeController,
    required this.isObscured,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: isObscured ? true : false,
        controller: typeController,
        decoration: InputDecoration(
          label: Text(labelItem),
          enabled: isEnabled ? true : false
        ),
      ),
    );
  }
}
