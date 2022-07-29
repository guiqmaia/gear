import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_sign_up.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  static const route = '/profile/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const BodySignUp(),
    );
  }
}
