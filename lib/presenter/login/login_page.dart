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
      appBar: AppBar(
        title: const Text('Gear'),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body: BodyLoginPage(
          loginController: loginController,
          passwordController: passwordController),
    );
  }
}
