import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context, false),
          child: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/icons/google.png'),
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
              child: Text('Por favor informe o email associado a sua conta e lhe enviaremos um email para a criação de uma nova senha',
              textAlign: TextAlign.center,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
