import 'package:flutter/material.dart';

class TextFieldSignUp extends StatelessWidget {
  final String labelItem;
  final IconData iconInput;
  final dynamic typeController;
  final bool isObscured;

  const TextFieldSignUp({
    Key? key,
    required this.labelItem,
    required this.iconInput,
    required this.typeController,
    required this.isObscured,
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
        color: Colors.blue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: typeController,
        obscureText: isObscured ? true : false,
        obscuringCharacter: '•',
        keyboardType: TextInputType.number,
        maxLength: 11,
        
        decoration: InputDecoration(
          labelText: labelItem,
          prefixIcon: Icon(
            iconInput,
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
