import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TextFieldAppFormatted extends StatelessWidget {
  final String labelItem;
  final dynamic typeController;
  TextInputFormatter? formater;
  TextInputType textInputType;

  TextFieldAppFormatted({
    Key? key,
    required this.labelItem,
    required this.typeController,
    this.formater,
    required this.textInputType,
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
        formatter: formater,
        controller: typeController,
        keyboardType: textInputType,
      ),
    );
  }
}

class RowFormatters extends StatelessWidget {
  final String label;
  final TextInputFormatter? formatter;
  TextEditingController controller;
  TextInputType keyboardType;
  RowFormatters({
    Key? key,
    required this.label,
    this.formatter,
    required this.controller,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(label)),
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter!,
      ],
      keyboardType: keyboardType,
    );
  }
}
