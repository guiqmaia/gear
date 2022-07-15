import 'package:flutter/material.dart';

class ContainerResetPassword extends StatelessWidget {
  const ContainerResetPassword({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.06),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        textAlign: TextAlign.start,
        controller: emailController,
        decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'Insira seu email',
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.black),
          ),
          hintStyle:
              TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
