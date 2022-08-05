import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:gear/presenter/edit_profile_page/widgets/focus_node_edit_profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/widgets/text_field_app.dart';
import '../../../../shared/widgets/text_field_app_formatted.dart';
import '../../../infra/providers/login_providers.dart';

class WrapTextFieldEditUser extends HookConsumerWidget {
  const WrapTextFieldEditUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final telephoneController = ref.watch(telephoneControllerProvider.state);
    final mobileNumberController = ref.watch(mobileControllerProvider.state);
    final cepController = ref.watch(cepControllerProvider.state);
    final adressController = ref.watch(adressControllerProvider.state);
    
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
          nextFocus: focusAddressEditeProfilePage,
        ),
        TextFieldApp(
          labelItem: 'Endereço',
          typeController: adressController.state,
          isObscured: false,
          focus: focusAddressEditeProfilePage,
        ),
      ],
    );
  }
}
