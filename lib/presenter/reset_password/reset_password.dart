import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_reset_password.dart';

class ResetPassword extends StatelessWidget {
  final emailController = TextEditingController();

  ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: BodyResetPassword(
        emailController: emailController,
      ),
    );
  }
}
