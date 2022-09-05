import 'dart:io';
import 'dart:typed_data';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/widgets/text_field_app.dart';
import '../../../../shared/widgets/text_field_app_formatted.dart';
import '../../../core/app_assets.dart';
import '../../../infra/providers/login_providers.dart';
import '../../product_signup/widgets/default_image_container.dart';
import 'focus_node_edit_profile_page.dart';

class WrapTextFieldEditUser extends StatefulHookConsumerWidget {
  const WrapTextFieldEditUser({Key? key}) : super(key: key);

  @override
  ConsumerState<WrapTextFieldEditUser> createState() => _WrapTextFieldEditUserState();
}

class _WrapTextFieldEditUserState extends ConsumerState<WrapTextFieldEditUser> {
  //File? image;
  Uint8List? photo;

  @override
  Widget build(BuildContext context) {
    final telephoneController = ref.watch(telephoneControllerProvider.state);
    final mobileNumberController = ref.watch(mobileControllerProvider.state);
    final cepController = ref.watch(cepControllerProvider.state);
    final streetController = ref.watch(streetControllerProvider.state);
    final numberController = ref.watch(numberControllerProvider.state);
    final cityController = ref.watch(cityControllerProvider.state);
    final stateController = ref.watch(stateControllerProvider.state);
    final photoProfile = ref.watch(photoProfileProvider.state);

    Future pickImage() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);

        if (image == null) return;

        final imageTemp = File(image.path);

        setState(
          () {
            photoProfile.state = imageTemp;
            photo = imageTemp.readAsBytesSync();
          },
        );
      } on PlatformException catch (e) {
        debugPrint('Failed to pick image: $e');
      }
    }

    return Wrap(
      children: [
        TextFieldAppFormatted(
          labelItem: 'Telefone',
          typeController: telephoneController.state,
          formater: TelefoneInputFormatter(),
          textInputType: TextInputType.number,
          focus: focusPhoneEditProfilePage,
          nextFocus: focusCellPhoneEditProfilePage,
        ),
        TextFieldAppFormatted(
          labelItem: 'Celular',
          typeController: mobileNumberController.state,
          formater: TelefoneInputFormatter(),
          textInputType: TextInputType.number,
          focus: focusCellPhoneEditProfilePage,
          nextFocus: focusCepEditProfilePage,
        ),
        TextFieldAppFormatted(
          labelItem: 'CEP',
          typeController: cepController.state,
          formater: CepInputFormatter(),
          textInputType: TextInputType.number,
          focus: focusCepEditProfilePage,
          nextFocus: focusStreetEditeProfilePage,
        ),
        TextFieldApp(
          labelItem: 'Endereço',
          typeController: streetController.state,
          isObscured: false,
          focus: focusStreetEditeProfilePage,
          nextFocus: focusNumberEditeProfilePage,
        ),
        TextFieldApp(
          labelItem: 'Número',
          typeController: numberController.state,
          isObscured: false,
          focus: focusNumberEditeProfilePage,
          nextFocus: focusCityEditeProfilePage,
        ),
        TextFieldApp(
          labelItem: 'Cidade',
          typeController: cityController.state,
          isObscured: false,
          focus: focusCityEditeProfilePage,
          nextFocus: focusStateEditeProfilePage,
        ),
        TextFieldApp(
          labelItem: 'Estado',
          typeController: stateController.state,
          isObscured: false,
          focus: focusStateEditeProfilePage,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenNeon,
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(
              vertical: 3,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
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
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width,
          child: photoProfile.state.path != '' ? Image.memory(photo!) : const DefaulImageContainer(),
        ),
      ],
    );
  }
}
