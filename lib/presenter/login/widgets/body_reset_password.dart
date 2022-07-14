import 'package:flutter/material.dart';

import '../../shared/widgets/btn_standard_app.dart';
import '../login_page.dart';
import 'container_reset_password.dart';

class BodyResetPassword extends StatelessWidget {
  const BodyResetPassword({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('assets/icons/email.png'),
          ),
          const SizedBox(height: 50),
          const Center(
            child: Text(
              'Esqueceu sua senha?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Por favor informe o email associado a sua conta e lhe enviaremos um email para a criação de uma nova senha',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          ContainerResetPassword(emailController: emailController),
          BtnStandardApp(
            title: 'Enviar',
            pageRoute: const LoginPage(),
            widthBtn: MediaQuery.of(context).size.width * 0.9,
          ),
        ],
      ),
    );
  }
}