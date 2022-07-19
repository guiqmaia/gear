import 'package:flutter/material.dart';
import 'package:gear/presenter/shared/widgets/text_field_app.dart';

import '../../shared/widgets/btn_standard_app.dart';
import '../login_page.dart';


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
          TextFieldApp(labelItem: 'Email', iconInput: Icons.email, typeController: emailController),
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