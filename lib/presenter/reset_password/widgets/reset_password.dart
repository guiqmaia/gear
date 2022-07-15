import 'package:flutter/material.dart';
import '../../../core/app_assets.dart';

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
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
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
