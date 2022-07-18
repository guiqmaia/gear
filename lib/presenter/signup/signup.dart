import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../login/login_page.dart';
import '../shared/widgets/big_text_app.dart';
import '../shared/widgets/btn_standard_app.dart';
import '../shared/widgets/text_field_app.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

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
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 20),
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
              iconInput: Icons.date_range,
              typeController: bithdayDateController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Nome do Negócio',
              iconInput: Icons.text_fields_outlined,
              typeController: bussinessNameController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'CNPJ',
              iconInput: Icons.numbers_sharp,
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
              iconInput: Icons.cell_wifi,
              typeController: cellphoneController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'CEP',
              iconInput: Icons.numbers,
              typeController: cepController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Endereço',
              iconInput: Icons.home,
              typeController: adressController,
              isObscured: false,
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: BigTextApp(text: 'Informações de Login'),
            ),
            TextFieldApp(
              labelItem: 'Email',
              iconInput: Icons.email,
              typeController: loginController,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Senha',
              iconInput: Icons.key,
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
