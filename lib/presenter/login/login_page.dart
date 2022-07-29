import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: BodyLoginPage(
        isVisible: true,
      ),
    );
  }
}
