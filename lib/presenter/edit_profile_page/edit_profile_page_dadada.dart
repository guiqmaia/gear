import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

import '../../core/app_getit.dart';
import '../../infra/database/gear_database.dart';
import '../../shared/widgets/btn_standard_app.dart';
import '../../shared/widgets/text_field_app.dart';
import '../../shared/widgets/text_field_app_formatted.dart';
import '../../shared/widgets/top_bar_app.dart';
import '../profile/widgets/body_profile_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
            const TopBarApp(
              title: 'Edit Profile',
              pageRoute: BodyProfilePage(),
              isProfile: false,
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
              formater: TelefoneInputFormatter(),
              textInputType: TextInputType.number,
            ),
            TextFieldAppFormatted(
              labelItem: 'Celular atual: ${logedUser.mobileNumber}',
              typeController: mobileNumberController,
              formater: TelefoneInputFormatter(),
              textInputType: TextInputType.number,
            ),
            TextFieldAppFormatted(
              labelItem: 'CEP atual: ${logedUser.cep}',
              typeController: cepController,
              formater: CepInputFormatter(),
              textInputType: TextInputType.number,
            ),
            TextFieldApp(
              labelItem: 'Endereço atual: ${logedUser.adress}',
              typeController: adressController,
              isObscured: false,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            BtnStandardApp(
              title: 'Concluir Edição',
              widthBtn: MediaQuery.of(context).size.width,
              onPressed: () {
                telephoneController ??= logedUser.telephone;
                mobileNumberController ??= logedUser.mobileNumber;
                cepController ??= logedUser.cep;
                adressController ??= logedUser.adress;
                GearDatabase.instance
                    .updateUser('telephone', telephoneController.text);
                GearDatabase.instance
                    .updateUser('mobileNumber', telephoneController.text);
                GearDatabase.instance.updateUser('cep', cepController.text);
                GearDatabase.instance
                    .updateUser('adress', adressController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
