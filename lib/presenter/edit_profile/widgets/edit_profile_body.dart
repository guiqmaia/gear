import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:gear/core/app_getit.dart';
import 'package:gear/presenter/profile/profile_page.dart';
import 'package:gear/presenter/shared/widgets/btn_standard_app.dart';
import 'package:gear/presenter/shared/widgets/text_field_app.dart';
import 'package:gear/presenter/shared/widgets/text_field_app_formatted.dart';
import 'package:gear/presenter/shared/widgets/top_bar_app.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({Key? key}) : super(key: key);

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  final necessaryController = TextEditingController();
  final telephoneController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final cepController = TextEditingController();
  final adressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBarApp(
              title: 'Edit Profile',
              pageRoute: ProfilePage(),
              isProfile: true,
            ),
            TextFieldApp(
              labelItem: 'Nome: ${logedUser.name}',
              typeController: necessaryController,
              isObscured: false,
              isEnabled: false,
            ),
            TextFieldApp(
              labelItem: 'Data de Nascimento: ${logedUser.birthday}',
              typeController: necessaryController,
              isObscured: false,
              isEnabled: false,
            ),
            TextFieldApp(
              labelItem: 'CPF: ${logedUser.cpf}',
              typeController: necessaryController,
              isObscured: false,
              isEnabled: false,
            ),
            TextFieldApp(
              labelItem: 'Nome da Empresa: ${logedUser.company}',
              typeController: necessaryController,
              isObscured: false,
              isEnabled: false,
            ),
            TextFieldApp(
              labelItem: 'CNPJ: ${logedUser.cnpj}',
              typeController: necessaryController,
              isObscured: false,
              isEnabled: false,
            ),
            TextFieldAppFormatted(
              labelItem: 'Telefone atual: ${logedUser.telephone}',
              typeController: telephoneController,
              isEnabled: true,
              formater: TelefoneInputFormatter(),
              textInputType: TextInputType.number,
            ),
            TextFieldAppFormatted(
              labelItem: 'Celular atual: ${logedUser.mobileNumber}',
              typeController: mobileNumberController,
              isEnabled: true,
              formater: TelefoneInputFormatter(),
              textInputType: TextInputType.number,
            ),
            TextFieldAppFormatted(
              labelItem: 'CEP atual: ${logedUser.cep}',
              typeController: cepController,
              isEnabled: true,
              formater: TelefoneInputFormatter(),
              textInputType: TextInputType.number,
            ),
            TextFieldApp(
              labelItem: 'Endereço atual: ${logedUser.adress}',
              typeController: adressController,
              isObscured: false,
              isEnabled: true,
            ),
            BtnStandardApp(
              title: 'Concluir Edição',
              widthBtn: MediaQuery.of(context).size.width * 0.85,
              pageRoute: const ProfilePage(),
            ),
          ],
        ),
      ),
    );
  }
}
