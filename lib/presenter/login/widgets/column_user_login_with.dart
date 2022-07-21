import 'package:flutter/material.dart';

import '../../signup/signup.dart';
import 'btn_login.dart';
import 'icons_btn_login.dart';

class ColumnUserLoginWith extends StatefulWidget {
  final TextEditingController loginController;
  final TextEditingController passwordController;

  const ColumnUserLoginWith({
    Key? key,
    required this.loginController,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<ColumnUserLoginWith> createState() => _ColumnUserLoginWithState();
}

class _ColumnUserLoginWithState extends State<ColumnUserLoginWith> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const IconsBtnLogin(),
          const Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: Text('Entrar com'),
          ),
          BtnLogin(
            loginController: widget.loginController,
            passwordController: widget.passwordController,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Signup()),
              );
            },
            child: const Text('Cadastre-se'),
          ),
        ],
      ),
    );
  }
}
