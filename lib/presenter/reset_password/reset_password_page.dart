import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_reset_password.dart';

class ResetPasswordPage extends StatelessWidget {
  final emailController = TextEditingController();

  ResetPasswordPage({Key? key}) : super(key: key);

  static const route = '/login/reset-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: BodyResetPassword(
          emailController: emailController,
        ),
      ),
    );
  }
}
