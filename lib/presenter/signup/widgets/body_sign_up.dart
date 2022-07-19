import 'package:flutter/material.dart';
import 'package:gear/presenter/login/login_page.dart';
import 'package:gear/presenter/shared/widgets/big_text_app.dart';
import 'package:gear/presenter/shared/widgets/btn_standard_app.dart';
import 'package:gear/presenter/shared/widgets/text_field_app.dart';

class BodySignUp extends StatelessWidget {
  const BodySignUp({
    Key? key,
    required this.nameController,
    required this.bithdayDateController,
    required this.bussinessNameController,
    required this.cnpjController,
    required this.phoneController,
    required this.cellphoneController,
    required this.cepController,
    required this.adressController,
    required this.loginController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController bithdayDateController;
  final TextEditingController bussinessNameController;
  final TextEditingController cnpjController;
  final TextEditingController phoneController;
  final TextEditingController cellphoneController;
  final TextEditingController cepController;
  final TextEditingController adressController;
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                pageRoute: const LoginPage(),
                widthBtn: MediaQuery.of(context).size.width * 9),
          )
        ],
      ),
    );
  }
}