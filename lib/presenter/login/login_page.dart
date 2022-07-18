import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../home/home_page.dart';
import 'widgets/body_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: BodyLoginPage(
          loginController: loginController,
          passwordController: passwordController),
    );
  }
}
