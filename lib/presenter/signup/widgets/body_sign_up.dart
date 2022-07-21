import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gear/presenter/shared/widgets/top_bar_app.dart';
import '../../shared/widgets/text_field_app.dart';
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
      child: Column(
        children: [
          const TopBarApp(
            title: 'Cadastre-se',
            pageRoute: null,
            isProfile: true,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                TextFieldApp(
                  labelItem: 'Nome Completo',
                  isObscured: false,
                  typeController: widget.nameController,
                ),
                TextFieldApp(
                  labelItem: 'Nome Completo',
                  isObscured: false,
                  typeController: widget.nameController,
                ),
                TextFieldAppFormatted(
                  labelItem: 'CPF',
                  typeController: widget.cpfController,
                  formater: CpfInputFormatter(),
                  textInputType: TextInputType.number,
                ),
                TextFieldAppFormatted(
                  labelItem: 'Data de Nascimento',
                  typeController: widget.bithdayDateController,
                  formater: DataInputFormatter(),
                  textInputType: TextInputType.number,
                ),
                TextFieldApp(
                  labelItem: 'Nome do Negócio',
                  typeController: widget.bussinessNameController,
                  isObscured: false,
                ),
                TextFieldAppFormatted(
                  labelItem: 'CNPJ',
                  typeController: widget.cnpjController,
                  formater: CnpjInputFormatter(),
                  textInputType: TextInputType.number,
                ),
                TextFieldAppFormatted(
                  labelItem: 'Telefone',
                  typeController: widget.phoneController,
                  formater: TelefoneInputFormatter(),
                  textInputType: TextInputType.number,
                ),
                TextFieldAppFormatted(
                  labelItem: 'Celular',
                  typeController: widget.cellphoneController,
                  formater: TelefoneInputFormatter(),
                  textInputType: TextInputType.number,
                ),
                TextFieldAppFormatted(
                  labelItem: 'CEP',
                  typeController: widget.cepController,
                  formater: CepInputFormatter(),
                  textInputType: TextInputType.number,
                ),
                TextFieldApp(
                  labelItem: 'Endereço',
                  typeController: widget.adressController,
                  isObscured: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: BigTextApp(text: 'Informações de Login'),
                ),
                TextFieldApp(
                  labelItem: 'Email',
                  typeController: widget.loginController,
                  isObscured: false,
                ),
                TextFieldApp(
                  labelItem: 'Senha',
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
                        cpf: widget.cpfController.text,
                        birthday: widget.bithdayDateController.text,
                        company: widget.bussinessNameController.text,
                        cnpj: widget.cnpjController.text,
                        telephone: widget.phoneController.text,
                        mobileNumber: widget.cellphoneController.text,
                        cep: widget.cepController.text,
                        adress: widget.adressController.text,
                        email: widget.loginController.text,
                        password: widget.passwordController.text,
                      );
                      await GearDatabase.instance.insertUser(userModel);
                      // await GearDatabase.instance.select();
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
