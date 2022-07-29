import 'package:flutter/material.dart';

import '../../../../core/app_getit.dart';
import '../../../../infra/database/gear_database.dart';
import '../../../core/app_assets.dart';
import '../../home/home_page.dart';

class BtnEditUser extends StatefulWidget {
  final TextEditingController telephoneController;
  final TextEditingController mobileNumberController;
  final TextEditingController cepController;
  final TextEditingController adressController;
  final int userId;

  const BtnEditUser({
    Key? key,
    required this.telephoneController,
    required this.mobileNumberController,
    required this.cepController,
    required this.adressController,
    required this.userId,
  }) : super(key: key);

  @override
  State<BtnEditUser> createState() => _BtnEditUserState();
}

class _BtnEditUserState extends State<BtnEditUser> {
  Future updateTelephoneUser() async {
    if (widget.telephoneController.text != '') {
      await GearDatabase.instance.update(
        'user',
        widget.userId,
        'telephone',
        '"${widget.telephoneController.text}"',
      );
      setState(() {
        logedUser.telephone = widget.telephoneController.text;
      });
    }
  }

  Future updateMobileNumberUser() async {
    if (widget.mobileNumberController.text != '') {
      await GearDatabase.instance.update(
        'user',
        widget.userId,
        'mobileNumber',
        '"${widget.mobileNumberController.text}"',
      );
      setState(() {
        logedUser.mobileNumber = widget.mobileNumberController.text;
      });
    }
  }

  Future updateCepUser() async {
    if (widget.adressController.text != '') {
      await GearDatabase.instance.update(
        'user',
        widget.userId,
        'adress',
        '"${widget.adressController.text}"',
      );
      setState(() {
        logedUser.adress = widget.adressController.text;
      });
    }
  }

  Future updateAdressUser() async {
    if (widget.cepController.text != '') {
      await GearDatabase.instance.update(
        'user',
        widget.userId,
        'cep',
        '"${widget.cepController.text}"',
      );
      setState(() {
        logedUser.cep = widget.cepController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greenNeon,
      ),
      margin: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      child: TextButton(
        onPressed: () {
          updateAdressUser();
          updateCepUser();
          updateTelephoneUser();
          updateMobileNumberUser();
          Navigator.of(context).pushNamed(HomePage.route);
        },
        child: const Text(
          'Editar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
