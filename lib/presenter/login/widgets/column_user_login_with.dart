import 'package:flutter/material.dart';

import '../../signup/signup_page.dart';
import 'btn_login.dart';
import 'icons_btn_login.dart';

class ColumnUserLoginWith extends StatelessWidget {
  const ColumnUserLoginWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const IconsBtnLogin(),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: Text('Entrar com'),
          ),
          const BtnLoginPage(),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SignupPage.route);
            },
            child: const Text('Cadastre-se'),
          ),
        ],
      ),
    );
  }
}
