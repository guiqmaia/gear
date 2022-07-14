import 'package:flutter/material.dart';

import 'body_reset_password.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context, false),
          child: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body: BodyResetPassword(emailController: emailController),
    );
  }
}
