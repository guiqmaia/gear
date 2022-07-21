import 'package:flutter/material.dart';
import '../../shared/widgets/text_field_app.dart';
import '../../../core/app_assets.dart';


import '../../shared/widgets/btn_standard_app.dart';
import '../../login/login_page.dart';

class BodyResetPassword extends StatelessWidget {
  const BodyResetPassword({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        color: backgroundGrey,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset(imgEmail),
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
            TextFieldApp(
              labelItem: 'Email',
              typeController: emailController,
              isObscured: false,
            ),
            BtnStandardApp(
              title: 'Enviar',
              pageRoute: const LoginPage(),
              widthBtn: MediaQuery.of(context).size.width * 0.9,
            ),
          ],
        ),
      ),
    );
  }
}
