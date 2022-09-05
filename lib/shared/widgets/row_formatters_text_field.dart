import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RowFormatters extends StatelessWidget {
  final String label;
  final TextInputFormatter? formatter;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? isEnabled;
  final int? requiredLength;
  final FocusNode focus;
  final FocusNode? nextFocus;

  const RowFormatters({
    Key? key,
    required this.label,
    this.formatter,
    required this.controller,
    required this.keyboardType,
    this.isEnabled = true,
    this.requiredLength,
    required this.focus,
    this.nextFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focus,
      onFieldSubmitted: (values){
        nextFocus?.requestFocus();
      },
      decoration: InputDecoration(
        label: Text(label),
        enabled: isEnabled!,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
