import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RowFormatters extends StatelessWidget {
  final String label;
  final TextInputFormatter? formatter;
  TextEditingController controller;
  TextInputType keyboardType;
  bool? isEnabled;
  int? requiredLength;

  RowFormatters({
    Key? key,
    required this.label,
    required this.controller,
    required this.keyboardType,
    this.isEnabled = true,
    this.formatter,
    this.requiredLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        enabled: isEnabled!
      ),
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
          if (value!.isEmpty) {
            return 'Este campo é obrigatório';
          } else if (requiredLength != null) {
            if (value.length < requiredLength!) {
              return 'Quantidade de caracteres insuficientes';
            }
            return null;
          }
          return null;
        },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter!,
      ],
    );
  }
}