import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:gear/presenter/shared/widgets/text_field_app.dart';
import '../../../core/app_assets.dart';
import '../../../infra/models/user_model.dart';
import '../../shared/widgets/big_text_app.dart';
import '../../shared/widgets/text_field_app_formatted.dart';

import '../../../infra/database/gear_database.dart';

class BodySignUp extends StatefulWidget {
  const BodySignUp({
    Key? key,
    required this.nameController,
    required this.bithdayDateController,
    required this.bussinessNameController,
    required this.cnpjController,
    required this.cpfController,
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
  final TextEditingController cpfController;
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
              typeController: widget.nameController,
            ),
            TextFieldAppFormatted(
              labelItem: 'CPF',
              iconInput: Icons.person,
              typeController: widget.nameController,
              isObscured: false,
              formater: CpfInputFormatter(),
            ),
            TextFieldAppFormatted(
              labelItem: 'Data de Nascimento',
              iconInput: Icons.date_range,
              typeController: widget.bithdayDateController,
              isObscured: false,
              formater: DataInputFormatter(),
            ),
            TextFieldApp(
              labelItem: 'Nome do Negócio',
              iconInput: Icons.text_fields_outlined,
              typeController: widget.bussinessNameController,
              isObscured: false,
            ),
            TextFieldAppFormatted(
              labelItem: 'CNPJ',
              iconInput: Icons.numbers_sharp,
              typeController: widget.cnpjController,
              formater: CnpjInputFormatter(),
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
            TextFieldAppFormatted(
              labelItem: 'CEP',
              iconInput: Icons.numbers,
              typeController: widget.cepController,
              formater: CepInputFormatter(),
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
              isObscured: true,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greenNeon,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.symmetric(
                vertical: 3,
              ),
              child: TextButton(
                onPressed: () async {
                  UserModel userModel = UserModel(
                    name: widget.nameController.text,
                    // cpf: widget.cpfController.text,
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
