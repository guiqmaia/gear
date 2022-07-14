import 'package:flutter/material.dart';

import 'container_text.dart';
import 'container_text_field_login.dart';
import 'container_text_field_password.dart';
import 'container_user_options.dart';

class BodyLoginPage extends StatelessWidget {
  const BodyLoginPage({
    Key? key,
    required this.loginController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ContainerText(),
          ContainerTextFieldLogin(loginController: loginController, textLabel: 'Email', textHint: 'Entre com seu email',),
          ContainerTextFieldPassword(passwordController: passwordController, textLabel: 'Senha', textHint: 'Entre com sua senha',),
          const ContainerUserOptions(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

