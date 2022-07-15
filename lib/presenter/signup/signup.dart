import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gear/presenter/login/login_page.dart';
import 'package:gear/presenter/shared/widgets/btn_standard_app.dart';

import '../shared/widgets/big_text_app.dart';
import '../shared/widgets/text_field_app.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
  final bithdayDateController = TextEditingController();
  final bussinessNameController = TextEditingController();
  final cnpjController = TextEditingController();
  final cepController = TextEditingController();
  final phoneController = TextEditingController();
  final cellphoneController = TextEditingController();
  final adressController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gear'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: BigTextApp(
                  text: 'Cadastre-se',
                ),
              ),
            ),
            TextFieldApp(
              labelItem: 'Nome Completo',
              iconInput: Icons.person,
              typeController: nameController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Data de Nascimento',
              iconInput: Icons.person,
              typeController: bithdayDateController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Nome do Negócio',
              iconInput: Icons.person,
              typeController: bussinessNameController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'CNPJ',
              iconInput: Icons.person,
              typeController: cnpjController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Telefone',
              iconInput: Icons.phone,
              typeController: phoneController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Celular',
              iconInput: Icons.person,
              typeController: cellphoneController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'CEP',
              iconInput: Icons.person,
              typeController: cepController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Endereço',
              iconInput: Icons.person,
              typeController: adressController,
              isObscured: false,
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: BigTextApp(text: 'Informações de Login'),
            ),
            TextFieldApp(
              labelItem: 'Email',
              iconInput: Icons.person,
              typeController: loginController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Senha',
              iconInput: Icons.person,
              typeController: passwordController,
              isObscured: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: BtnStandardApp(
                  title: 'Finalizar Cadastro',
                  pageRoute: LoginPage,
                  widthBtn: MediaQuery.of(context).size.width * 9),
            )
          ],
        ),
      ),
    );
  }
}
