import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/text_field_app.dart';
import '../../../../shared/widgets/text_field_app_formatted.dart';

class WrapTextFieldEditUser extends StatelessWidget {
  WrapTextFieldEditUser({
    Key? key,
    required this.telephoneController,
    required this.mobileNumberController,
    required this.cepController,
    required this.adressController,
  }) : super(key: key);

  TextEditingController telephoneController;
  TextEditingController mobileNumberController;
  TextEditingController cepController;
  TextEditingController adressController;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextFieldAppFormatted(
          labelItem: 'Telefone',
          typeController: telephoneController,
          formater: TelefoneInputFormatter(),
          textInputType: TextInputType.number,
        ),
        TextFieldAppFormatted(
          labelItem: 'Celular',
          typeController: mobileNumberController,
          formater: TelefoneInputFormatter(),
          textInputType: TextInputType.number,
        ),
        TextFieldAppFormatted(
          labelItem: 'CEP',
          typeController: cepController,
          formater: CepInputFormatter(),
          textInputType: TextInputType.number,
        ),
        TextFieldApp(
          labelItem: 'Endereço',
          typeController: adressController,
          isObscured: false,
        ),
      ],
    );
  }
}
