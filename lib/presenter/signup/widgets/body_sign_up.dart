import 'package:flutter/material.dart';
import 'package:gear/infra/models/user_model.dart';
import 'package:gear/presenter/login/login_page.dart';
import 'package:gear/presenter/shared/widgets/big_text_app.dart';
import 'package:gear/presenter/shared/widgets/btn_standard_app.dart';
import 'package:gear/presenter/shared/widgets/text_field_app.dart';

import '../../../infra/database/gear_database.dart';

class BodySignUp extends StatefulWidget {
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
  State<BodySignUp> createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
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
            typeController: widget.nameController,
            isObscured: false,
          ),
          TextFieldApp(
            labelItem: 'Data de Nascimento',
            iconInput: Icons.date_range,
            typeController: widget.bithdayDateController,
            isObscured: false,
          ),
          TextFieldApp(
            labelItem: 'Nome do Negócio',
            iconInput: Icons.text_fields_outlined,
            typeController: widget.bussinessNameController,
            isObscured: false,
          ),
          TextFieldApp(
            labelItem: 'CNPJ',
            iconInput: Icons.numbers_sharp,
            typeController: widget.cnpjController,
            isObscured: false,
          ),
          TextFieldApp(
            labelItem: 'Telefone',
            iconInput: Icons.phone,
            typeController: widget.phoneController,
            isObscured: false,
          ),
          TextFieldApp(
            labelItem: 'Celular',
            iconInput: Icons.cell_wifi,
            typeController: widget.cellphoneController,
            isObscured: false,
          ),
          TextFieldApp(
            labelItem: 'CEP',
            iconInput: Icons.numbers,
            typeController: widget.cepController,
            isObscured: false,
          ),
          TextFieldApp(
            labelItem: 'Endereço',
            iconInput: Icons.home,
            typeController: widget.adressController,
            isObscured: false,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: BigTextApp(text: 'Informações de Login'),
          ),
          TextFieldApp(
            labelItem: 'Email',
            iconInput: Icons.email,
            typeController: widget.loginController,
            isObscured: false,
          ),
          TextFieldApp(
            labelItem: 'Senha',
            iconInput: Icons.key,
            typeController: widget.passwordController,
            isObscured: false,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: TextButton(
              onPressed: () async {
                UserModel userModel = UserModel(
                  name: widget.nameController.text,
                  birthday: widget.bithdayDateController.text,
                  company: widget.bussinessNameController.text,
                  cnpj: widget.cnpjController.text,
                  telephone: widget.phoneController.text,
                  cellPhone: widget.cellphoneController.text,
                  cep: widget.cepController.text,
                  adress: widget.adressController.text,
                  login: widget.loginController.text,
                  password: widget.passwordController.text,
                );
                await GearDatabase.instance.insertUser(userModel);
                //await GearDatabase.instance.select();
                if (!mounted) return;
                Navigator.of(context).pop(context);
              },
              child: const Text(
                'Finalizar cadastro',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
