import 'package:flutter/material.dart';

import '../../../core/app_getit.dart';
import '../../../infra/database/gear_database.dart';
import '../../../shared/widgets/btn_standard_app.dart';

class BtnEditUser extends StatefulWidget {
  final TextEditingController telephoneController;
  final TextEditingController mobileNumberController;
  final TextEditingController cepController;
  final TextEditingController adressController;

  const BtnEditUser({
    Key? key,
    required this.telephoneController,
    required this.mobileNumberController,
    required this.cepController,
    required this.adressController,
  }) : super(key: key);

  @override
  State<BtnEditUser> createState() => _BtnEditUserState();
}

class _BtnEditUserState extends State<BtnEditUser> {
  Future updateTelephoneUser() async {
    if (widget.telephoneController.text != '') {
      await GearDatabase.instance.updateUser(
        logedUser.cpf,
        'telephone',
        widget.telephoneController.text,
      );
    }
  }

  Future updateMobileNumberUser() async {
    if (widget.mobileNumberController.text != '') {
      await GearDatabase.instance.updateUser(
        logedUser.cpf,
        'mobileNumber',
        widget.mobileNumberController.text,
      );
    }
  }

  Future updateCepUser() async {
    if (widget.adressController.text != '') {
      await GearDatabase.instance.updateUser(
        logedUser.cpf,
        'adress',
        widget.adressController.text,
      );
    }
  }

  Future updateAdressUser() async {
    if (widget.cepController.text != '') {
      await GearDatabase.instance.updateUser(
        logedUser.cpf,
        'cep',
        widget.cepController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BtnStandardApp(
      title: 'Concluir Edição',
      widthBtn: MediaQuery.of(context).size.width,
      onPressed: () {
        updateTelephoneUser();
        updateMobileNumberUser();
        updateCepUser();
        updateAdressUser();
      },
    );
  }
}
