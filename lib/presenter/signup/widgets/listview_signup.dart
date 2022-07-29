import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/gear_database.dart';
import '../../../infra/models/user_model.dart';
import '../../../shared/widgets/text_field_app.dart';
import '../../../shared/widgets/text_field_app_formatted.dart';
import '../../login/login_providers.dart';

class ListViewSignUp extends HookConsumerWidget {
  const ListViewSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nameControllerProvider.state);
    final cpfController = ref.watch(cpfControllerProvider.state);
    final birthdayController = ref.watch(birthdayControllerProvider.state);
    final businessNameController =
        ref.watch(businessNameControllerProvider.state);
    final cnpjController = ref.watch(cnpjControllerProvider.state);
    final telephoneController = ref.watch(telephoneControllerProvider.state);
    final mobileNumberController = ref.watch(mobileControllerProvider.state);
    final cepController = ref.watch(cepControllerProvider.state);
    final adressController = ref.watch(adressControllerProvider.state);
    final loginController = ref.watch(loginControllerProvider.state);
    final passwordController = ref.watch(passwordControllerProvider.state);
    final userModel = ref.watch(userModelProvider.state);

    final _formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFieldApp(
              labelItem: 'Nome Completo',
              isObscured: false,
              typeController: nameController.state,
            ),
            TextFieldAppFormatted(
              labelItem: 'CPF',
              typeController: cpfController.state,
              formater: CpfInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 11,
            ),
            TextFieldAppFormatted(
              labelItem: 'Data de Nascimento',
              typeController: birthdayController.state,
              formater: DataInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 8,
            ),
            TextFieldApp(
              labelItem: 'Nome do Negócio',
              typeController: businessNameController.state,
              isObscured: false,
            ),
            TextFieldAppFormatted(
              labelItem: 'CNPJ',
              typeController: cnpjController.state,
              formater: CnpjInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 14,
            ),
            TextFieldAppFormatted(
              labelItem: 'Telefone',
              typeController: telephoneController.state,
              formater: TelefoneInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 10,
            ),
            TextFieldAppFormatted(
              labelItem: 'Celular',
              typeController: mobileNumberController.state,
              formater: TelefoneInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 10,
            ),
            TextFieldAppFormatted(
              labelItem: 'CEP',
              typeController: cepController.state,
              formater: CepInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 8,
            ),
            TextFieldApp(
              labelItem: 'Endereço',
              typeController: adressController.state,
              isObscured: false,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'Informações de Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFieldApp(
              labelItem: 'Email',
              typeController: loginController.state,
              isObscured: false,
            ),
            TextFieldApp(
              labelItem: 'Senha',
              typeController: passwordController.state,
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
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Cadastro realizado com sucesso'),
                    ));
                    UserModel user = UserModel(
                      name: nameController.state.text,
                      cpf: cpfController.state.text,
                      birthday: birthdayController.state.text,
                      company: businessNameController.state.text,
                      cnpj: cnpjController.state.text,
                      telephone: telephoneController.state.text,
                      mobileNumber: mobileNumberController.state.text,
                      cep: cepController.state.text,
                      adress: adressController.state.text,
                      email: loginController.state.text,
                      password: passwordController.state.text,
                    );
                    await GearDatabase.instance.insert('user', user);
                    Navigator.of(context).pop(context);
                  }
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
    );
  }
}
