import 'package:flutter/material.dart';

class ContainerTextField extends StatefulWidget {
  final String textLabel;
  final String textHint;
  final dynamic controller;

  ContainerTextField({
    Key? key,
    required this.textLabel,
    required this.textHint,
    required this.controller,
  }) : super(key: key);

  @override
  State<ContainerTextField> createState() => _ContainerTextFieldState();
}

class _ContainerTextFieldState extends State<ContainerTextField> {
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
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.textLabel,
          hintText: widget.textHint,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.black),
          ),
          hintStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
