import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../infra/models/user_model.dart';
import '../../shared/widgets/big_text_app.dart';
import '../../shared/widgets/text_field_app.dart';

import '../../../infra/database/gear_database.dart';

class BodySignUp extends StatefulWidget {
  BodySignUp({
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
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: BigTextApp(
                  text: 'Cadastre-se',
                ),
              ),
            ),
            TextFieldApp(
              labelItem: 'Nome Completo',
              iconInput: Icons.person,
              isObscured: false,
              isFormatted: true,
              formater: KmInputFormatter(),
              typeController: widget.nameController,
            ),
            TextFieldApp(
              labelItem: 'CPF',
              iconInput: Icons.person,
              typeController: widget.nameController,
              isObscured: false,
              isFormatted: false,
              formater: CpfInputFormatter(),
            ),
            TextFieldApp(
              labelItem: 'Data de Nascimento',
              iconInput: Icons.date_range,
              typeController: widget.bithdayDateController,
              isObscured: false,
              isFormatted: false,
              formater: DataInputFormatter(),
            ),
            TextFieldApp(
              labelItem: 'Nome do Negócio',
              iconInput: Icons.text_fields_outlined,
              typeController: widget.bussinessNameController,
              formater: CepInputFormatter(),
              isFormatted: false,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'CNPJ',
              iconInput: Icons.numbers_sharp,
              typeController: widget.cnpjController,
              formater: CnpjInputFormatter(),
              isObscured: false,
              isFormatted: false,
            ),
            TextFieldApp(
              labelItem: 'Telefone',
              iconInput: Icons.phone,
              typeController: widget.phoneController,
              formater: TelefoneInputFormatter(),
              isFormatted: false,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Celular',
              iconInput: Icons.cell_wifi,
              formater: TelefoneInputFormatter(),
              typeController: widget.cellphoneController,
              isFormatted: false,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'CEP',
              iconInput: Icons.numbers,
              typeController: widget.cepController,
              isFormatted: false,
              formater: CepInputFormatter(),
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Endereço',
              iconInput: Icons.home,
              isFormatted: false,
              typeController: widget.adressController,
              formater: CepInputFormatter(),
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
              isFormatted: false,
              isObscured: false,
              formater: CepInputFormatter(),
            ),
            TextFieldApp(
              labelItem: 'Senha',
              iconInput: Icons.key,
              typeController: widget.passwordController,
              isFormatted: false,
              isObscured: true,
              formater: CepInputFormatter(),
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
      ),
    );
  }
}
