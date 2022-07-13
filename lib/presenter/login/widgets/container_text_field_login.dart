import 'package:flutter/material.dart';

class ContainerTextFieldLogin extends StatefulWidget {
  String textLabel;
  String textHint;

  ContainerTextFieldLogin({
    Key? key,
    required this.textLabel,
    required this.textHint,
    required this.loginController,
  }) : super(key: key);

  final TextEditingController loginController;

  @override
  State<ContainerTextFieldLogin> createState() => _ContainerTextFieldLoginState();
}

class _ContainerTextFieldLoginState extends State<ContainerTextFieldLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        textAlign: TextAlign.start,
        controller: widget.loginController,
        decoration: InputDecoration(
          labelText: widget.textLabel,
          hintText: widget.textHint,
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