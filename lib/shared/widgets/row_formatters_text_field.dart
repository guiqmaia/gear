import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RowFormatters extends StatelessWidget {
  final String label;
  final TextInputFormatter? formatter;
  TextEditingController controller;
  TextInputType keyboardType;
  bool? isEnabled;

  RowFormatters({
    Key? key,
    required this.label,
    required this.controller,
    required this.keyboardType,
    this.isEnabled = true,
    this.formatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(label),
        enabled: isEnabled!
      ),
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter!,
      ],
    );
  }
}