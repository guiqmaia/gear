import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  final String labelItem;
  final dynamic typeController;
  final bool isObscured;
  final bool isEnabled;
  final bool isVisible = true;
  final Function(String)? onChanged;
  final int? requiredLength;

  const TextFieldApp({
    Key? key,
    required this.labelItem,
    required this.typeController,
    required this.isObscured,
    this.isEnabled = true,
    this.onChanged,
    this.requiredLength,
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
      child: TextFormField(
        obscureText: isObscured ? true : false,
        controller: typeController,
        onChanged: onChanged,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Este campo é obrigatório';
          } else if (requiredLength != null) {
            if (value.length < requiredLength!) {
              return 'Quantidade de caracteres insuficientes';
            }
          }
          return null;
        },
        decoration: InputDecoration(
          label: Text(labelItem),
          enabled: isEnabled,
          // suffixIcon: isVisible ?  Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
      ),
    );
  }
}
