import 'package:flutter/material.dart';

class ContainerTextFieldPassword extends StatelessWidget {
  String textLabel;
  String textHint;

   ContainerTextFieldPassword({
    Key? key,
    required this.passwordController,
    required this.textLabel,
    required this.textHint,

  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: true,
        textAlign: TextAlign.start,
        controller: passwordController,
        decoration: InputDecoration(
          labelText: textLabel,
          hintText: textHint,
          border: const OutlineInputBorder (
            borderSide: BorderSide(width: 3, color: Colors.black),
          ),
          hintStyle:
              const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}