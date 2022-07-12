import 'package:flutter/material.dart';
import 'package:gear/presenter/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController = TextEditingController();
  final PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gear'),
        centerTitle: true,
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
      body:  Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            child: Text('Seja Bem Vindo'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              controller: LoginController,
              decoration: const InputDecoration(
                hintText: 'Entre com seu email',
                border: InputBorder.none,
              ),
            ),
          ),
          ],
          ),
      
      ),
    );
  }
}
