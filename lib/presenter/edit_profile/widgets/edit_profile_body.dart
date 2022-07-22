import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:gear/presenter/profile/profile_page.dart';
import 'package:gear/presenter/shared/widgets/top_bar_app.dart';

import '../../../core/app_getit.dart';
import '../../../infra/database/gear_database.dart';
import '../../../infra/models/user_model.dart';
import '../../profile/widgets/body_profile_page.dart';
import '../../shared/widgets/btn_standard_app.dart';
import '../../shared/widgets/text_field_app.dart';
import '../../shared/widgets/text_field_app_formatted.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({Key? key}) : super(key: key);

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  final necessaryController = TextEditingController();
  dynamic telephoneController = TextEditingController();
  dynamic mobileNumberController = TextEditingController();
  dynamic cepController = TextEditingController();
  dynamic adressController = TextEditingController();
  dynamic emailController = TextEditingController();
  dynamic passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarApp(
              title: 'Edit Profile',
              pageRoute: BodyProfilePage(),
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
              formater: CepInputFormatter(),
              textInputType: TextInputType.number,
            ),
            TextFieldApp(
              labelItem: 'Endereço atual: ${logedUser.adress}',
              typeController: adressController,
              isObscured: false,
              isEnabled: true,
            ),
            BtnStandardApp(
              onPressed: () async {
                telephoneController ??= logedUser.telephone;
                mobileNumberController ??= logedUser.mobileNumber;
                cepController ??= logedUser.cep;
                adressController ??= logedUser.adress;
                UserModel user = UserModel(
                  name: logedUser.name,
                  cpf: logedUser.cpf,
                  birthday: logedUser.birthday,
                  company: logedUser.company,
                  cnpj: logedUser.cnpj,
                  telephone: telephoneController.text,
                  mobileNumber: mobileNumberController.text,
                  cep: cepController.text,
                  adress: adressController.text,
                  email: logedUser.email,
                  password: logedUser.password,
                );
                await GearDatabase.instance.update(user);
              },
              title: 'Concluir Edição',
              widthBtn: MediaQuery.of(context).size.width,
              pageRoute: const BodyProfilePage(),
            ),
          ],
        ),
      ),
    );
  }
}
