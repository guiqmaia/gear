import 'package:flutter/material.dart';

import 'package:gear/presenter/home/home_page.dart';
import 'package:gear/presenter/shared/widgets/btn_standard_app.dart';

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
          ContainerTextFieldLogin(
            loginController: loginController,
            textLabel: 'Email',
            textHint: 'Entre com seu email',
          ),
          ContainerTextFieldPassword(
            passwordController: passwordController,
            textLabel: 'Senha',
            textHint: 'Entre com sua senha',
          ),
          const ContainerUserOptions(),
          Column(
            children: [
              Wrap(
                spacing: 10,
                children: [
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 25,
                    ),
                  ),
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 25,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: Text('Entrar com'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BtnStandardApp(
                      title: 'Entrar',
                      pageRoute: const HomePage(),
                      widthBtn: MediaQuery.of(context).size.width * 0.9),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
