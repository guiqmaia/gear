import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../infra/models/adress_model.dart';
import '../../../infra/repository/address_repository.dart';
import '../../../infra/repository/user_repository.dart';
import '../../login/login_page.dart';
import 'focus_node_signup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_assets.dart';
import '../../../infra/models/user_model.dart';
import '../../../infra/providers/login_providers.dart';
import '../../../shared/widgets/text_field_app.dart';
import '../../../shared/widgets/text_field_app_formatted.dart';
import '../../product_signup/Widgets/default_image_container.dart';

class ListViewSignUp extends StatefulHookConsumerWidget {
  const ListViewSignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<ListViewSignUp> createState() => _ListViewSignUpState();
}

class _ListViewSignUpState extends ConsumerState<ListViewSignUp> {
  File? image;
  Uint8List? photo;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(
        () {
          this.image = imageTemp;
          photo = imageTemp.readAsBytesSync();
        },
      );
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final nameController = ref.watch(nameControllerProvider.state);
    final cpfController = ref.watch(cpfControllerProvider.state);
    final birthdayController = ref.watch(birthdayControllerProvider.state);
    final businessNameController = ref.watch(businessNameControllerProvider.state);
    final cnpjController = ref.watch(cnpjControllerProvider.state);
    final telephoneController = ref.watch(telephoneControllerProvider.state);
    final mobileNumberController = ref.watch(mobileControllerProvider.state);
    final cepController = ref.watch(cepControllerProvider.state);
    final streetController = ref.watch(streetControllerProvider.state);
    final numberController = ref.watch(numberControllerProvider.state);
    final cityController = ref.watch(cityControllerProvider.state);
    final stateController = ref.watch(stateControllerProvider.state);
    final loginController = ref.watch(loginControllerProvider.state);
    final passwordController = ref.watch(passwordControllerProvider.state);

    final formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFieldApp(
              labelItem: 'Nome Completo',
              isObscured: false,
              typeController: nameController.state,
              focus: focusNameSignUp,
              nextFocus: focusCpfSignUp,
            ),
            TextFieldAppFormatted(
              labelItem: 'CPF',
              typeController: cpfController.state,
              formater: CpfInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 11,
              focus: focusCpfSignUp,
              nextFocus: focusBirthdayDateSignUp,
            ),
            TextFieldAppFormatted(
              labelItem: 'Data de Nascimento',
              typeController: birthdayController.state,
              formater: DataInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 8,
              focus: focusBirthdayDateSignUp,
              nextFocus: focusCompanyNameSignUp,
            ),
            TextFieldApp(
              labelItem: 'Nome do Negócio',
              typeController: businessNameController.state,
              isObscured: false,
              focus: focusCompanyNameSignUp,
              nextFocus: focusCnpjSignUp,
            ),
            TextFieldAppFormatted(
              labelItem: 'CNPJ',
              typeController: cnpjController.state,
              formater: CnpjInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 14,
              focus: focusCnpjSignUp,
              nextFocus: focusPhoneSignUp,
            ),
            TextFieldAppFormatted(
              labelItem: 'Telefone',
              typeController: telephoneController.state,
              formater: TelefoneInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 10,
              focus: focusPhoneSignUp,
              nextFocus: focusCellPhoneSignUp,
            ),
            TextFieldAppFormatted(
              labelItem: 'Celular',
              typeController: mobileNumberController.state,
              formater: TelefoneInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 10,
              focus: focusCellPhoneSignUp,
              nextFocus: focusCepSignUp,
            ),
            TextFieldAppFormatted(
              labelItem: 'CEP',
              typeController: cepController.state,
              formater: CepInputFormatter(),
              textInputType: TextInputType.number,
              requiredLength: 8,
              focus: focusCepSignUp,
              nextFocus: focusStreetSignUp,
            ),
            TextFieldApp(
              labelItem: 'Endereço',
              typeController: streetController.state,
              isObscured: false,
              focus: focusStreetSignUp,
              nextFocus: focusNumberSignUp,
            ),
            TextFieldApp(
              labelItem: 'Número',
              typeController: numberController.state,
              isObscured: false,
              focus: focusNumberSignUp,
              nextFocus: focusCitySignUp,
            ),
            TextFieldApp(
              labelItem: 'Cidade',
              typeController: cityController.state,
              isObscured: false,
              focus: focusCitySignUp,
              nextFocus: focusStateSignUp,
            ),
            TextFieldApp(
              labelItem: 'Estado',
              typeController: stateController.state,
              isObscured: false,
              focus: focusStateSignUp,
              nextFocus: focusEmailSignUp,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greenNeon,
              ),
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(
                vertical: 3,
              ),
              width: MediaQuery.of(context).size.width * 0.93,
              child: TextButton(
                onPressed: (() => pickImage()),
                child: const Text(
                  'Selecionar Imagem',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: image != null ? Image.memory(photo!) : const DefaulImageContainer(),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
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
              focus: focusEmailSignUp,
              nextFocus: focusPasswordSignUp,
            ),
            TextFieldApp(
              labelItem: 'Senha',
              typeController: passwordController.state,
              isObscured: true,
              focus: focusPasswordSignUp,
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
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.symmetric(
                vertical: 3,
              ),
              child: TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Cadastro realizado com sucesso',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );

                    UserModel user = UserModel(
                      name: nameController.state.text,
                      cpf: cpfController.state.text,
                      birthday: birthdayController.state.text,
                      company: businessNameController.state.text,
                      cnpj: cnpjController.state.text,
                      telephone: telephoneController.state.text,
                      mobileNumber: mobileNumberController.state.text,
                      email: loginController.state.text,
                      password: passwordController.state.text,
                      image: base64Encode(photo!.buffer.asUint8List()),
                    );

                    UserRepository userRepository = UserRepository();
                    await userRepository.post('http://192.168.0.43:81/api/user', user);

                    List<UserModel> users = await userRepository.get('http://192.168.0.43:81/api/user');
                    user = users.last;

                    AddressModel address = AddressModel(
                      cep: cepController.state.text,
                      street: streetController.state.text,
                      number: int.parse(numberController.state.text),
                      city: cityController.state.text,
                      state: stateController.state.text,
                      userId: user.id!,
                    );

                    AddressRepository addressRepository = AddressRepository();
                    addressRepository.post('http://192.168.0.43:81/api/Address', address);

                    Navigator.of(context).pushReplacementNamed(LoginPage.route);
                    nameController.state.clear();
                    cpfController.state.clear();
                    birthdayController.state.clear();
                    businessNameController.state.clear();
                    cnpjController.state.clear();
                    telephoneController.state.clear();
                    mobileNumberController.state.clear();
                    cepController.state.clear();
                    streetController.state.clear();
                    numberController.state.clear();
                    cityController.state.clear();
                    stateController.state.clear();
                    loginController.state.clear();
                    passwordController.state.clear();

                    if (mounted) {
                      Navigator.of(context).pushReplacementNamed(LoginPage.route);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Algumas informações estão incorretas',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
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
