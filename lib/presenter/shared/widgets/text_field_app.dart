import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldApp extends StatelessWidget {
  final String labelItem;
  final IconData iconInput;
  final dynamic typeController;
  bool? isObscured;


  TextFieldApp({
    Key? key,
    required this.labelItem,
    required this.iconInput,
    required this.typeController,
    this.isObscured = false, 
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
      child: RowFormatters(
        label: labelItem, isObscured: false,
      ),
    );
  }
}

class RowFormatters extends StatelessWidget {
  bool? isObscured;
  final String label;
  RowFormatters({
    Key? key,
    required this.label,
    this.isObscured = false,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return TextField(
      decoration: InputDecoration(label: Text(label)),
      obscureText: true,
       obscuringCharacter: '•',
    );
  }
}
