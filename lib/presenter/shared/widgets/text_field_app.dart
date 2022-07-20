import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TextFieldApp extends StatelessWidget {
  final String labelItem;
  final IconData iconInput;
  final dynamic typeController;
  bool? isObscured;
  TextInputFormatter? formater;
  bool? isFormatted = false;

  TextFieldApp({
    Key? key,
    required this.labelItem,
    required this.iconInput,
    required this.typeController,
    this.isObscured = false,
    this.formater,
    this.isFormatted,
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
        label: labelItem,
        formatter: isFormatted! ? formater : formater,
      ),
    );
  }
}

class RowFormatters extends StatelessWidget {
  final String label;
  final TextInputFormatter? formatter;
  RowFormatters({
    Key? key,
    required this.label,
    this.formatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(label)),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter!,
      ],
    );
  }
}