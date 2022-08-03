import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  final String labelItem;
  final dynamic typeController;
  bool isObscured = true;
  FocusNode focus;
  FocusNode? nextFocus;
  Function(String)? onChanged;
  int? requiredLength;

  TextFieldApp({
    Key? key,
    required this.labelItem,
    required this.typeController,
    required this.isObscured,
    required this.focus,
    this.nextFocus,
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        focusNode: focus,
        onFieldSubmitted: (value) {
          nextFocus?.requestFocus();
        },
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
