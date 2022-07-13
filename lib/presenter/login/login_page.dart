import 'package:flutter/material.dart';
import 'package:gear/presenter/home/home_page.dart';

import 'package:gear/presenter/login/widgets/my_checked_box.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 45, bottom: 20),
              child: const Text(
                'Seja bem vindo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                textAlign: TextAlign.start,
                controller: LoginController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Entre com seu email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.black),
                  ),
                  hintStyle:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                textAlign: TextAlign.start,
                controller: PasswordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Entre com sua senha',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black)),
                  hintStyle:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const  [
                      MyCheckedBox(),
                      SizedBox(width: 2),
                      Text('Lembrar', style: TextStyle(fontSize: 12),),
                    ],
                  ),
                  const SizedBox(width: 1),
                  const Text('Esqueceu a senha?', style: TextStyle(fontSize: 12),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
