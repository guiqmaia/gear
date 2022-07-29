import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../shared/widgets/btn_standard_app.dart';
import '../../../shared/widgets/text_field_app.dart';
import '../../login/login_page.dart';

class BodyResetPassword extends StatelessWidget {
  final TextEditingController emailController;

  const BodyResetPassword({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset(imgEmail),
            ),
            const SizedBox(height: 50),
            const Text(
              'Esqueceu sua senha?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Por favor informe o email associado a sua conta e lhe enviaremos um email para a criação de uma nova senha',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            TextFieldApp(
              labelItem: 'Email',
              typeController: emailController,
              isObscured: false,
            ),
            BtnStandardApp(
              title: 'Enviar',
              pageRoute: LoginPage.route,
              widthBtn: MediaQuery.of(context).size.width * 0.9,
            ),
          ],
        ),
      ),
    );
  }
}
